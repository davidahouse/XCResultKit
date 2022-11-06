//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestFailureSummary
//  * Kind: object
//  * Properties:
//    + message: String?
//    + fileName: String
//    + lineNumber: Int
//    + isPerformanceFailure: Bool
//    + uuid: String
//    + issueType: String?
//    + detailedDescription: String?
//    + attachments: [ActionTestAttachment]
//    + associatedError: TestAssociatedError?
//    + sourceCodeContext: SourceCodeContext?
//    + timestamp: Date?
//    + isTopLevelFailure: Bool

import Foundation

public struct ActionTestFailureSummary: XCResultObject {
    public let message: String?
    public let fileName: String?
    public let lineNumber: Int
    public let isPerformanceFailure: Bool
    public let uuid: String
    public let issueType: String?
    public let detailedDescription: String?
    public let attachments: [ActionTestAttachment]
    public let associatedError: TestAssociatedError?
    public let sourceCodeContext: SourceCodeContext?
    public let timestamp: Date?
    public let isTopLevelFailure: Bool
    
    public init?(_ json: [String: AnyObject]) {
        do {
            message = xcOptional(element: "message", from: json)
            fileName = xcOptional(element: "fileName", from: json)
            lineNumber = xcOptional(element: "lineNumber", from: json) ?? 0
            isPerformanceFailure = xcOptional(element: "isPerformanceFailure", from: json) ?? false
            uuid = try xcRequired(element: "uuid", from: json)
            issueType = xcOptional(element: "issueType", from: json)
            detailedDescription = xcOptional(element: "detailedDescription", from: json)
            attachments = xcArray(element: "attachments", from: json).ofType(ActionTestAttachment.self)
            associatedError = xcOptional(element: "associatedError", from: json)
            sourceCodeContext = xcOptional(element: "sourceCodeContext", from: json)
            timestamp = xcOptional(element: "timestamp", from: json)
            isTopLevelFailure = xcOptional(element: "isTopLevelFailure", from: json) ?? false
        } catch {
            logError("Error parsing ActionTestExpectedFailure: \(error.localizedDescription)")
            return nil
        }
    }
}
