//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionRecord
//    * Kind: object
//* Properties:
//+ schemeCommandName: String
//+ schemeTaskName: String
//+ title: String?
//+ startedTime: Date
//+ endedTime: Date
//+ runDestination: ActionRunDestinationRecord
//+ buildResult: ActionResult
//+ actionResult: ActionResult

import Foundation

public struct ActionRecord: XCResultObject {
    public let schemeCommandName: String
    public let schemeTaskName: String
    public let title: String?
    public let startedTime: Date
    public let endedTime: Date
    public let runDestination: ActionRunDestinationRecord
    public let buildResult: ActionResult
    public let actionResult: ActionResult
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            schemeCommandName = try xcRequired(element: "schemeCommandName", from: json)
            schemeTaskName = try xcRequired(element: "schemeTaskName", from: json)
            buildResult = try xcRequired(element: "buildResult", from: json)
            actionResult = try xcRequired(element: "actionResult", from: json)
            title = xcOptional(element: "title", from: json)
            startedTime = try xcRequired(element: "startedTime", from: json)
            endedTime = try xcRequired(element: "endedTime", from: json)
            runDestination = try xcRequired(element: "runDestination", from: json)
        } catch {
            logError("Error parsing ActionRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
