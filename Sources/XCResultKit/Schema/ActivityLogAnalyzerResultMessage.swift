//
//  ActivityLogAnalyzerResultMessage.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogAnalyzerResultMessage
//* Supertype: ActivityLogMessage
//* Kind: object
//* Properties:
//  + steps: [ActivityLogAnalyzerStep]
//  + resultType: String?
//  + keyEventIndex: Int

public struct ActivityLogAnalyzerResultMessage: XCResultObject {
    public let type: String
    public let title: String
    public let shortTitle: String?
    public let category: String?
    public let location: DocumentLocation?
    public let annotations: [ActivityLogMessageAnnotation]

    public let steps: [ActivityLogAnalyzerStep]
    public let resultType: String?
    public let keyEventIndex: Int

    public init?(_ json: [String: AnyObject]) {
        do {
            type = try xcRequired(element: "type", from: json)
            title = try xcRequired(element: "title", from: json)
            shortTitle = xcOptional(element: "shortTitle", from: json)
            category = xcOptional(element: "category", from: json)
            location = xcOptional(element: "location", from: json)
            annotations = xcArray(element: "annotation", from: json)
                .ofType(ActivityLogMessageAnnotation.self)

            steps = xcArray(element: "steps", from: json)
                .ofType(ActivityLogAnalyzerStep.self)
            resultType = xcOptional(element: "resultType", from: json)
            keyEventIndex = try xcRequired(element: "keyEventIndex", from: json)
        } catch {
            logError("Error parsing ActivityLogAnalyzerResultMessage: \(error.localizedDescription)")
            return nil
        }
    }
}
