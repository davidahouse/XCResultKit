//
//  ActivityLogMajorSection.swift
//  XCResultKitTests
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogMajorSection
//* Supertype: ActivityLogSection
//* Kind: object
//* Properties:
//  + subtitle: String

public struct ActivityLogMajorSection: XCResultObject {
    public let domainType: String
    public let title: String
    public let startTime: Date?
    public let duration: Double
    public let result: String?
    public let location: DocumentLocation?
    public let subsections: [ActivityLogSection]
    public let messages: [ActivityLogMessage]

    public let subtitle: String

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

            subtitle = try xcRequired(element: "subtitle", from: json)
        } catch {
            logError("Error parsing ActivityLogTargetBuildSection: \(error.localizedDescription)")
            return nil
        }
    }
}
