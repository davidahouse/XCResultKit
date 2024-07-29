import Foundation
#if os(macOS)
import XCTest
@testable import XCResultKit

final class XCResultFileTests: XCTestCase {
    
    enum ParserTestError: Error {
        case noTestFound
    }

    lazy var temporaryOutputDirectoryURL:URL  = {
        // Setup a temp test folder that can be used as a sandbox
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let temporaryOutputDirectoryName = UUID().uuidString
        let temporaryOutputDirectoryURL =
        tempDirectoryURL.appendingPathComponent(temporaryOutputDirectoryName)
        tempDirectoryURL.createDirectoryIfNecessary(createIntermediates: false)
        return temporaryOutputDirectoryURL
    }()
    
    func testScreenshotsHEIC() throws {
        let file = try Resource(name: "testHEIC", type: "xcresult")
        let xcResultFile = XCResultFile(url: file.url)
        temporaryOutputDirectoryURL.createDirectoryIfNecessary()
        
        try getAllAttachment(
            resultFile: xcResultFile
        ).forEach { attachement in
            xcResultFile.exportAttachment(
                attachment: attachement,
                outputPath: temporaryOutputDirectoryURL.path
            )
        }

        let fileURLs = FileManager.default.listFiles(path: temporaryOutputDirectoryURL.path)
        let heicURLs = fileURLs.filter { $0.pathExtension == "heic" }
        XCTAssertTrue(heicURLs.count == 18)
    }
    
    func testScreenshotsPNG() throws {
        let file = try Resource(name: "testHEIC", type: "xcresult")
        let xcResultFile = XCResultFile(url: file.url)
        temporaryOutputDirectoryURL.createDirectoryIfNecessary()
        
        try getAllAttachment(
            resultFile: xcResultFile
        ).forEach {
            guard let id = $0.payloadRef?.id,
                  let filename = $0.filename else { return }
            let path = temporaryOutputDirectoryURL.appendingPathComponent(filename).path
            xcResultFile.exportAttachment(
                id: id,
                outputPath: path,
                type: .file
            )
        }

        let fileURLs = FileManager.default.listFiles(path: temporaryOutputDirectoryURL.path)
        let pngURLs = fileURLs.filter { $0.pathExtension == "png" }
        XCTAssertTrue(pngURLs.count == 42)
    }
    
    private func getAllAttachment(
        resultFile: XCResultFile
    ) throws -> [ActionTestAttachment] {

        let testActions = resultFile.getInvocationRecord()?
            .actions
            .filter { $0.schemeCommandName == "Test" }
        guard let testActions = testActions, !testActions.isEmpty else {
            throw ParserTestError.noTestFound
        }
        
        var actionTestAttachment: [ActionTestAttachment] = []
    
        for testAction in testActions {
            guard let testsId = testAction.actionResult.testsRef?.id,
                  let testPlanRun = resultFile.getTestPlanRunSummaries(id: testsId) else { continue }
            let testPlanRunSummaries = testPlanRun.summaries
            
            for thisSummary in testPlanRunSummaries {
                for thisTestableSummary in thisSummary.testableSummaries {
                    for group in thisTestableSummary.tests {
                        actionTestAttachment.append(contentsOf: printSummaryRef(from: group, result: resultFile))
                    }
                }
            }
        }
        return actionTestAttachment
    }
    
    private func printSummaryRef(
        from group: ActionTestSummaryGroup,
        result: XCResultFile
    ) -> [ActionTestAttachment] {
        if !group.subtests.isEmpty {
            return group.subtests.flatMap {
                guard let id = $0.summaryRef?.id, let tests = result.getActionTestSummary(id: id)
                else { return [ActionTestAttachment]() }
                return tests.activitySummaries.flatMap { printActionTestActivitySummary(from: $0) }
            }
        } else {
            return group.subtestGroups.flatMap { printSummaryRef(from: $0, result: result) }
        }
    }
    
    
    private func printActionTestActivitySummary(
        from summary: ActionTestActivitySummary
    ) -> [ActionTestAttachment] {
        if !summary.subactivities.isEmpty {
            return summary.subactivities.flatMap { printActionTestActivitySummary(from: $0) }
        } else {
            return summary.attachments
        }
    }

    
    static var allTests = [
        ("testScreenshotsHEIC", testScreenshotsHEIC),
        ("testScreenshotsPNG", testScreenshotsPNG)
    ]
}

public extension Foundation.URL {
    func createDirectoryIfNecessary(createIntermediates: Bool = false) {
        var isDirectory: ObjCBool = false
        if !FileManager.default.fileExists(atPath: self.path, isDirectory: &isDirectory) {
            try? FileManager.default.createDirectory(at: self, withIntermediateDirectories: createIntermediates)
        }
    }
}
#endif
