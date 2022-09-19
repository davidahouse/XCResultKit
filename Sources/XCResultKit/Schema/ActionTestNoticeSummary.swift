//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActionTestNoticeSummary
//  * Kind: object
//  * Properties:
//    + message: String?
//    + fileName: String
//    + lineNumber: Int
//    + timestamp: Date?

public struct ActionTestNoticeSummary: XCResultObject {
    public let message: String?
    public let fileName: String
    public let lineNumber: Int
    public let timestamp: Date?
        
    public init?(_ json: [String: AnyObject]) {
        do {
            message = xcOptional(element: "message", from: json)
            fileName = try xcRequired(element: "fileName", from: json)
            lineNumber = try xcRequired(element: "lineNumber", from: json)
            timestamp = xcOptional(element: "timestamp", from: json)
        } catch {
            logError("Error parsing ActionTestNoticeSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
