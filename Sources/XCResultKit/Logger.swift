//
//  Logger.swift
//  Rainbow
//
//  Created by Pierre Felgines on 04/10/2019.
//

import Foundation

/// Log message only in debug environment
func debug(_ message: String) {
    #if DEBUG
        print(message)
    #endif
}
