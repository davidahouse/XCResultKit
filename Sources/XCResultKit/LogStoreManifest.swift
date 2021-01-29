//
//  File.swift
//  
//
//  Created by David House on 1/24/21.
//

import Foundation

enum LogStoreManifestError: Error {
    case invalidVersion
}

/// Load & parse the LogStoreManifest.plist file that can be found in the Derived Data sub folder
/// Logs/Test. This file contains information about all the test executions captured by Xcode
/// for the project.
class LogStoreManifest {
    
    var executions: [LogStoreExecution] = []
    
    /// Initialize with the path to the LogStoreManifest.plist
    init(url: URL) throws {
        if let data = try? Data(contentsOf: url),
           let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: Any] {
            try parseExecutions(from: plist)
        }
    }
    
    /// Initialize with the Data from a LogStoreManifest.plist file
    init(data: Data) throws {
        if let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: Any] {
         try parseExecutions(from: plist)
        }
    }
    
    private func parseExecutions(from plist: [String: Any]) throws {
        
        guard let fileVersion = plist["logFormatVersion"] as? Int, fileVersion == 10 else {
            throw LogStoreManifestError.invalidVersion
        }
        
        guard let logs = plist["logs"] as? [String: Any] else {
            return
        }
        
        for (_, value) in logs {
            if let executionDetails = value as? [String: Any] {
                executions.append(LogStoreExecution(executionDetails))
            }
        }
    }
}
