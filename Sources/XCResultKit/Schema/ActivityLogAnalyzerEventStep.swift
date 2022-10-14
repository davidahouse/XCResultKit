//
//  ActivityLogAnalyzerEventStep.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogAnalyzerStep
//  * Kind: object
//  * Properties:
//    + parentIndex: Int
//
//        - ActivityLogAnalyzerEventStep
//          * Supertype: ActivityLogAnalyzerStep
//          * Kind: object
//          * Properties:
//            + title: String
//            + location: DocumentLocation?
//            + description: String
//            + callDepth: Int

public struct ActivityLogAnalyzerEventStep: XCResultObject {
    public let parentIndex: Int
    public let title: String
    public let location: DocumentLocation?
    public let description: String
    public let callDepth: Int

    public init?(_ json: [String: AnyObject]) {
        do {
            parentIndex = try xcRequired(element: "parentIndex", from: json)
            title = try xcRequired(element: "title", from: json)
            location = xcOptional(element: "location", from: json)
            description = try xcRequired(element: "description", from: json)
            callDepth = try xcRequired(element: "callDepth", from: json)
        } catch {
            logError("Error parsing ActivityLogAnalyzerEventStep: \(error.localizedDescription)")
            return nil
        }
    }
}
