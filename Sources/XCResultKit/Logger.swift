//
//  Logger.swift
//  Rainbow
//
//  Created by Pierre Felgines on 04/10/2019.
//

import Foundation

/// Log message only in debug environment
func logError(_ message: String) {
    #if DEBUG
        if let data = "\(message)\n".data(using: .utf8) {
            FileHandle.standardError.write(data)
        }
    #endif
}
