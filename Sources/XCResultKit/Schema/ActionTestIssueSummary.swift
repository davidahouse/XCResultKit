//
//  ActionTestIssueSummary.swift
//  
//
//  Created by Tyler Vick on 7/10/23.
//
// - ActionTestIssueSummary
// * Kind: object
// * Properties:
//     + message: String?
//     + fileName: String
//     + lineNumber: Int
//     + uuid: String
//     + issueType: String?
//     + detailedDescription: String?
//     + attachments: [ActionTestAttachment]
//     + associatedError: TestAssociatedError?
//     + sourceCodeContext: SourceCodeContext?
//     + timestamp: Date?

import Foundation

public struct ActionTestIssueSummary: XCResultObject {

    public let message: String?
    public let fileName: String
    public let lineNumber: Int
    public let uuid: String
    public let issueType: String?
    public let detailedDescription: String?
    public let attachments: [ActionTestAttachment]
    public let associatedError: TestAssociatedError?
    public let sourceCodeContext: SourceCodeContext?
    public let timestamp: Date?

    public init?(_ json: [String: AnyObject]) {
        do {
            message = xcOptional(element: "message", from: json)
            fileName = try xcRequired(element: "fileName", from: json)
            lineNumber = try xcRequired(element: "lineNumber", from: json)
            uuid = try xcRequired(element: "uuid", from: json)
            issueType = xcOptional(element: "issueType", from: json)
            detailedDescription = xcOptional(element: "detailedDescription", from: json)
            attachments = xcArray(element: "attachments", from: json)
                .ofType(ActionTestAttachment.self)
            associatedError = xcOptional(element: "associatedError", from: json)
            sourceCodeContext = xcOptional(element: "sourceCodeContext", from: json)
            timestamp = xcOptional(element: "timestamp", from: json)
        } catch {
            logError("Error parsing ActionTestIssueSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
