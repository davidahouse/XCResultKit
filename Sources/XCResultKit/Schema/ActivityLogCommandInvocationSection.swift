//
//  ActivityLogCommandInvocationSection.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogCommandInvocationSection
//* Supertype: ActivityLogSection
//* Kind: object
//* Properties:
//  + commandDetails: String
//  + emittedOutput: String
//  + exitCode: Int?

public struct ActivityLogCommandInvocationSection: XCResultObject {
    public let domainType: String
    public let title: String
    public let startTime: Date?
    public let duration: Double
    public let result: String?
    public let location: DocumentLocation?
    public let subsections: [ActivityLogSection]
    public let messages: [ActivityLogMessage]

    public let commandDetails: String
    public let emittedOutput: String?
    public let exitCode: Int?

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

            commandDetails = try xcRequired(element: "commandDetails", from: json)
            emittedOutput = xcOptional(element: "emittedOutput", from: json)
            exitCode = xcOptional(element: "exitCode", from: json)
        } catch {
            logError("Error parsing ActivityLogCommandInvocationSection: \(error.localizedDescription)")
            return nil
        }
    }
}
