//
//  ActivityLogTargetBuildSection.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogTargetBuildSection
//  * Supertype: ActivityLogMajorSection
//  * Kind: object
//  * Properties:
//    + productType: String?

public struct ActivityLogTargetBuildSection: XCResultObject {
    public let domainType: String
    public let title: String
    public let startTime: Date?
    public let duration: Double
    public let result: String?
    public let subsections: [ActivityLogMajorSection]
    public let unitTestSubsections: [ActivityLogUnitTestSection]
    public let commandInvocationSubsections: [ActivityLogCommandInvocationSection]
    public let targetBuildSubsections: [ActivityLogTargetBuildSection]
    public let messages: [ActivityLogMessage]
    public let resultMessages: [ActivityLogAnalyzerResultMessage]
    public let warningMessage: [ActivityLogAnalyzerWarningMessage]

    public let subtitle: String
    public let productType: String?

    public init?(_ json: [String : AnyObject]) {
        do {
            domainType = try xcRequired(element: "domainType", from: json)
            title = try xcRequired(element: "title", from: json)
            startTime = xcOptional(element: "startTime", from: json)
            duration = try xcRequired(element: "duration", from: json)
            result = xcOptional(element: "result", from: json)
            subsections = xcArray(element: "subsections", from: json)
                .ofType(ActivityLogMajorSection.self)
            unitTestSubsections = xcArray(element: "subsections", from: json)
                .ofType(ActivityLogUnitTestSection.self)
            commandInvocationSubsections = xcArray(element: "subsections", from: json)
                .ofType(ActivityLogCommandInvocationSection.self)
            targetBuildSubsections = xcArray(element: "subsections", from: json)
                .ofType(ActivityLogTargetBuildSection.self)
            messages = xcArray(element: "messages", from: json)
                .ofType(ActivityLogMessage.self)
            resultMessages = xcArray(element: "messages", from: json)
                .ofType(ActivityLogAnalyzerResultMessage.self)
            warningMessage = xcArray(element: "messages", from: json)
                .ofType(ActivityLogAnalyzerWarningMessage.self)

            subtitle = try xcRequired(element: "subtitle", from: json)
            productType = xcOptional(element: "productType", from: json)
        } catch {
            debug("Error parsing ActivityLogTargetBuildSection: \(error.localizedDescription)")
            return nil
        }
    }
}
