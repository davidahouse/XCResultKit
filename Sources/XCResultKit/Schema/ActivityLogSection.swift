//
//  ActivityLogSection.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 03/10/2019.
//

import Foundation

//- ActivityLogSection
//  * Kind: object
//  * Properties:
//    + domainType: String
//    + title: String
//    + startTime: Date?
//    + duration: Double
//    + result: String?
//    + subsections: [ActivityLogSection]
//    + messages: [ActivityLogMessage]

public struct ActivityLogSection: XCResultObject {
    public let domainType: String
    public let title: String
    public let startTime: Date?
    public let duration: Double
    public let result: String?
    public let location: DocumentLocation?
    public let subsections: [ActivityLogSection]
    public let messages: [ActivityLogMessage]

    public init?(_ json: [String: AnyObject]) {
        do {
            domainType = try xcRequired(element: "domainType", from: json)
            title = try xcRequired(element: "title", from: json)
            startTime = xcOptional(element: "startTime", from: json)
            duration = try xcRequired(element: "duration", from: json)
            result = xcOptional(element: "result", from: json)
            location = xcOptional(element: "location", from: json)
            subsections = xcArray(element: "subsections", from: json)
                .ofType(ActivityLogSection.self)
            messages = xcArray(element: "messages", from: json)
                .ofType(ActivityLogMessage.self)
        } catch {
            logError("Error parsing ActivityLogSection: \(error.localizedDescription)")
            return nil
        }
    }
}
