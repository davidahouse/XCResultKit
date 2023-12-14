//
//  ActionTestActivitySummary.swift
//  
//
//  Created by David House on 7/5/19.
//
// - ActionTestActivitySummary
// * Kind: object
// * Properties:
//     + title: String
//     + activityType: String
//     + uuid: String
//     + start: Date?
//     + finish: Date?
//     + attachments: [ActionTestAttachment]
//     + subactivities: [ActionTestActivitySummary]
//     + failureSummaryIDs: [String]
//     + expectedFailureIDs: [String]
//     + warningSummaryIDs: [String]

import Foundation

public struct ActionTestActivitySummary: XCResultObject {

    public let title: String
    public let activityType: String
    public let uuid: String
    public let start: Date?
    public let finish: Date?
    public let attachments: [ActionTestAttachment]
    public let subactivities: [ActionTestActivitySummary]
    public let failureSummaryIDs: [String]
    public let expectedFailureIDs: [String]
    public let warningSummaryIDs: [String]

    public init?(_ json: [String: AnyObject]) {
        do {
            title = try xcRequired(element: "title", from: json)
            activityType = try xcRequired(element: "activityType", from: json)
            uuid = try xcRequired(element: "uuid", from: json)
            start = xcOptional(element: "start", from: json)
            finish = xcOptional(element: "finish", from: json)
            attachments = xcArray(element: "attachments", from: json)
                .ofType(ActionTestAttachment.self)
            subactivities = xcArray(element: "subactivities", from: json)
                .ofType(ActionTestActivitySummary.self)
            failureSummaryIDs = xcArray(element: "failureSummaryIDs", from: json).ofType(String.self)
            expectedFailureIDs = xcArray(element: "expectedFailureIDs", from: json).ofType(String.self)
            warningSummaryIDs = xcArray(element: "warningSummaryIDs", from: json).ofType(String.self)
        } catch {
            logError("Error parsing ActionTestActivitySummary: \(error.localizedDescription)")
            return nil
        }
    }
}
