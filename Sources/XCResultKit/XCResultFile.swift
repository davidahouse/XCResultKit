//
//  XCResultFile.swift
//  
//
//  Created by David House on 7/6/19.
//

import Foundation

public class XCResultFile {
    
    private enum XCRunOutput {
        case always
        case onlyOnSuccess
        case never
    }
    
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func getInvocationRecord() -> ActionsInvocationRecord? {
        
        guard let data = xcresulttool(["get", "--path", url.path, "--format", "json"]) else {
            return nil
        }
        
        do {
            guard let rootJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] else {
                logError("Expecting top level dictionary but didn't find one")
                return nil
            }
            
            let invocation = ActionsInvocationRecord(rootJSON)
            return invocation
        } catch {
            logError("Error deserializing JSON: \(error)")
            return nil
        }
    }
    
    public func getTestPlanRunSummaries(id: String) -> ActionTestPlanRunSummaries? {
        guard let rootJSON = getRootJson(id: id) else {
            return nil
        }

        return ActionTestPlanRunSummaries(rootJSON)
    }

    public func getLogs(id: String) -> ActivityLogSection? {
        guard let rootJSON = getRootJson(id: id) else {
            return nil
        }

        return ActivityLogSection(rootJSON)
    }
    
    public func getActionTestSummary(id: String) -> ActionTestSummary? {
        guard let rootJSON = getRootJson(id: id) else {
            return nil
        }
        
        return ActionTestSummary(rootJSON)
    }
    
    func getRootJson(id: String) -> [String: AnyObject]? {
        guard let data = xcresulttool(["get", "--path", url.path, "--id", id, "--format", "json"]) else {
            return nil
        }

        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject]
        } catch {
            logError("Error deserializing JSON: \(error)")
            return nil
        }
    }

    public func getPayload(id: String) -> Data? {
        
        guard let data = xcresulttool(["get", "--path", url.path, "--id", id]) else {
            return nil
        }
        return data
    }
    
    public func exportPayload(id: String) -> URL? {
        
        let tempPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(id)
        xcresulttool(["export", "--type", "file", "--path", url.path, "--id", id, "--output-path", tempPath.path], output: .never)
        return tempPath
    }

    /// Encodes the root invocation record and any available referenced objects
    /// - Returns: A json blob of the invocation record's json structure
    public func exportRecursiveJson() -> Data? {
        let encoder = JSONEncoder()
        encoder.userInfo[.xcResultFile] = self
        // Set Date format to use unix epoch
        encoder.dateEncodingStrategy = .secondsSince1970
        return try? encoder.encode(getInvocationRecord())
    }

    public func getCodeCoverage() -> CodeCoverage? {
        
        guard let data = xcrun(["xccov", "view", "--report", "--json", url.path]) else {
            return nil
        }

        do {
            let decoded = try JSONDecoder().decode(CodeCoverage.self, from: data)
            return decoded
        } catch {
            logError("Error deserializing JSON: \(error)")
            return nil
        }
    }
	
	@discardableResult
	private func xcresulttool(_ args: [String], output: XCRunOutput = .onlyOnSuccess) -> Data? {
		var arguments = args
		
		// xcrun version 70 ships a new version of xcresulttool. Ensure compatibility.
		if let versionData = xcrun(["--version"]), let versionString = String(data: versionData, encoding: .ascii) {
			let scanner = Scanner(string: versionString)
			scanner.scanString("xcrun version ", into: nil)
			
			var version: Double = 0
			if scanner.scanDouble(&version), version >= 70.0 {
				arguments.append("--legacy")
			}
		}
		
		arguments.insert("xcresulttool", at: 0)
		return xcrun(arguments, output: output)
	}
    
    /// The export type can be file or directory
    public enum ExportType: String {
        case file
        case directory
    }
    
    
    /// Export attachment file or folder
    ///
    ///     If the folder where the file will be exported doesn't exist, the command will fail
    ///     with this example: (error: unexpected error at top-level: noEntry)
    ///
    /// - Parameters:
    ///   - id: The id of xcresult object
    ///   - outputPath: The export output path location
    ///   - type: The export type
    ///
    /// - Note: The outputPath must contained the path of folder and the name of the final exported file with an extension
    ///
    public func exportAttachment(id: String, outputPath: String, type: ExportType) {
        let processArgs = [
            "xcresulttool",
            "export",
            "--type", type.rawValue,
            "--path", url.path,
            "--id", id,
            "--output-path", outputPath
        ]
        
        xcrun(processArgs, output: .never)
    }
    
    /// Export attachment file or folder
    ///
    ///     if the folder where the file will be exported doesn't exist, the command will fail
    ///     with this example (error: unexpected error at top-level: noEntry)
    ///
    /// - Parameters:
    ///   - attachment: The ActionTestAttachment object
    ///   - outputPath: The export output path location
    ///
    /// - Note: The outputPath must contained the path of folder where the final file or folder will be exported
    ///
    public func exportAttachment(attachment: ActionTestAttachment, outputPath: String) {
        guard let id = attachment.payloadRef?.id else { return }
        let type = ExportType.file.rawValue
        let filename = attachment.filename ?? id
        let attachmentOutputPath = URL(fileURLWithPath: outputPath).appendingPathComponent(filename)
        
        let processArgs = [
            "xcresulttool",
            "export",
            "--type", type,
            "--path", url.path,
            "--id", id,
            "--output-path", attachmentOutputPath.path
        ]
        
        xcrun(processArgs, output: .never)
    }
    
    @discardableResult
    private func xcrun(_ arguments: [String], output: XCRunOutput = .onlyOnSuccess) -> Data? {
        autoreleasepool {
            let task = Process()
            task.launchPath = "/usr/bin/xcrun"
            task.arguments = arguments
            
            var resultData: Data?
            if output != .never {
                let pipe = Pipe()
                task.standardOutput = pipe
                task.launch()
                
                resultData = pipe.fileHandleForReading.readDataToEndOfFile()
            } else {
                task.launch()
            }
            
            task.waitUntilExit()

            let taskSucceeded = task.terminationStatus == EXIT_SUCCESS
            
            switch output {
            case .always:
                return resultData
            case .onlyOnSuccess:
                return taskSucceeded ? resultData : nil
            case .never:
                return nil
            }
        }
    }
}

public extension CodingUserInfoKey {
    static let xcResultFile = CodingUserInfoKey(rawValue: "xcResultFile")!
}
