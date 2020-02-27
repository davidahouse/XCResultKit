//
//  ActivityLogMessage.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 03/10/2019.
//

import Foundation

//- ActivityLogMessage
//  * Kind: object
//  * Properties:
//    + type: String
//    + title: String
//    + shortTitle: String?
//    + category: String?
//    + location: DocumentLocation?
//    + annotations: [ActivityLogMessageAnnotation]

public struct ActivityLogMessage: XCResultObject {
    public let type: String
    public let title: String
    public let shortTitle: String?
    public let category: String?
    public let location: DocumentLocation?
    public let annotations: [ActivityLogMessageAnnotation]

    public init?(_ json: [String: AnyObject]) {
        do {
            type = try xcRequired(element: "type", from: json)
            title = try xcRequired(element: "title", from: json)
            shortTitle = xcOptional(element: "shortTitle", from: json)
            category = xcOptional(element: "category", from: json)
            location = xcOptional(element: "location", from: json)
            annotations = xcArray(element: "annotation", from: json)
                .ofType(ActivityLogMessageAnnotation.self)
        } catch {
            logError("Error parsing ActivityLogMessage: \(error.localizedDescription)")
            return nil
        }
    }
}
