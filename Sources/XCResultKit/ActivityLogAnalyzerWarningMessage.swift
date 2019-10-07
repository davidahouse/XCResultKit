//
//  ActivityLogAnalyzerWarningMessage.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogAnalyzerWarningMessage
// * Supertype: ActivityLogMessage
// * Kind: object

public struct ActivityLogAnalyzerWarningMessage: XCResultObject {
    public let type: String
    public let title: String
    public let shortTitle: String?
    public let category: String?
    public let location: DocumentLocation
    public let annotations: [ActivityLogMessageAnnotation]

    public init?(_ json: [String : AnyObject]) {
        do {
            type = try xcRequired(element: "type", from: json)
            title = try xcRequired(element: "title", from: json)
            shortTitle = xcOptional(element: "shortTitle", from: json)
            category = xcOptional(element: "category", from: json)
            location = try xcRequired(element: "location", from: json)
            annotations = xcArray(element: "annotation", from: json)
                .ofType(ActivityLogMessageAnnotation.self)
        } catch {
            debug("Error parsing ActivityLogAnalyzerWarningMessage: \(error.localizedDescription)")
            return nil
        }
    }
}
