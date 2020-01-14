//
//  CodeCoverage.swift
//  
//
//  Created by David House on 7/6/19.
//

import Foundation

public struct CodeCoverage: Codable {
    public let coveredLines: Int
    public let lineCoverage: Double
    public let executableLines: Int
    public let targets: [CodeCoverageTarget]
    
    public init() {
        coveredLines = 0
        lineCoverage = 0.0
        executableLines = 0
        targets = []
    }
    
    public init(target: String, files: [CodeCoverageFile]) {        
        if files.count > 0 {
            let target = CodeCoverageTarget(name: target, buildProductPath: "", files: files)
            coveredLines = target.coveredLines
            lineCoverage = target.lineCoverage
            executableLines = target.executableLines
            targets = [target]
        } else {
            coveredLines = 0
            lineCoverage = 0.0
            executableLines = 0
            targets = []
        }
    }
    
    public init(targets: [CodeCoverageTarget]){
        coveredLines = targets.reduce(0) {$0 + $1.coveredLines}
        executableLines = targets.reduce(0) {$0 + $1.executableLines}
        lineCoverage = Double(coveredLines) / Double(executableLines)
        self.targets = targets
    }
    
    public func filesCoveredAdequately() -> [CodeCoverageFile] {
        var files: [CodeCoverageFile] = []
        for target in targets {
            let foundFiles = target.files.filter { $0.lineCoverage >= 0.80}
            files += foundFiles
        }
        return files
    }
    
    public func filesWithNoCoverage() -> [CodeCoverageFile] {
        var files: [CodeCoverageFile] = []
        for target in targets {
            let foundFiles = target.files.filter { $0.lineCoverage == 0.0}
            files += foundFiles
        }
        return files
    }
    
    public func fileMatching(target: String, name: String) -> CodeCoverageFile? {
        
        let foundTargets = targets.filter { $0.name == target }
        guard let foundTarget = foundTargets.first else {
            return nil
        }
        
        let foundFiles = foundTarget.files.filter { $0.name == name }
        guard let foundFile = foundFiles.first else {
            return nil
        }
        return foundFile
    }
}

public struct CodeCoverageTarget: Codable {
    public let coveredLines: Int
    public let lineCoverage: Double
    public let name: String
    public let executableLines: Int
    public let buildProductPath: String
    public let files: [CodeCoverageFile]

    public init(name: String,  buildProductPath: String, files: [CodeCoverageFile]){
        self.name = name
        self.files = files
        self.buildProductPath = buildProductPath
        if files.count > 0 {
            coveredLines = files.reduce(0) {$0 + $1.coveredLines}
            executableLines = files.reduce(0) {$0 + $1.executableLines}
            lineCoverage = Double(coveredLines) / Double(executableLines)
        } else {
            coveredLines = 0
            lineCoverage = 0.0
            executableLines = 0
        }
    }
}

public struct CodeCoverageFile: Codable {
    public let coveredLines: Int
    public let lineCoverage: Double
    public let path: String
    public let name: String
    public let executableLines: Int
    
    public init(coveredLines: Int, lineCoverage: Double,  path: String, name: String, executableLines: Int){
        self.name = name
        self.coveredLines = coveredLines
        self.lineCoverage = lineCoverage
        self.executableLines = executableLines
        self.path = path
    }
}
