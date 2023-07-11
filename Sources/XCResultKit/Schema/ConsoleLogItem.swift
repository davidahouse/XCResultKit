//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//
// - ConsoleLogItem
// * Kind: object
// * Properties:
//     + adaptorType: String?
//     + kind: String?
//     + timestamp: Double
//     + content: String
//     + logData: ConsoleLogItemLogData?

import Foundation

public struct ConsoleLogItem: XCResultObject {
    public let adaptorType: String?
    public let kind: String?
    public let timestamp: Double
    public let content: String
    public let logData: ConsoleLogItemLogData?
    
    public init?(_ json: [String: AnyObject]) {
        do {
            adaptorType = xcOptional(element: "adaptorType", from: json)
            kind = xcOptional(element: "kind", from: json)
            timestamp = try xcRequired(element: "timestamp", from: json)
            content = try xcRequired(element: "content", from: json)
            logData = xcOptional(element: "logData", from: json)
        } catch {
            logError("Error parsing ConsoleLogItem: \(error.localizedDescription)")
            return nil
        }
    }
}
