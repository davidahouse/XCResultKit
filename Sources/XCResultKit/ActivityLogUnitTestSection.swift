//
//  ActivityLogUnitTestSection.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogUnitTestSection
//  * Supertype: ActivityLogSection
//  * Kind: object
//  * Properties:
//    + testName: String?
//    + suiteName: String?
//    + summary: String?
//    + emittedOutput: String?
//    + performanceTestOutput: String?
//    + testsPassedString: String?
//    + runnablePath: String?
//    + runnableUTI: String?

public struct ActivityLogUnitTestSection: XCResultObject {
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

    public let testName: String?
    public let suiteName: String?
    public let summary: String?
    public let emittedOutput: String?
    public let performanceTestOutput: String?
    public let testsPassedString: String?
    public let runnablePath: String?
    public let runnableUTI: String?

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

            testName = xcOptional(element: "testName", from: json)
            suiteName = xcOptional(element: "suiteName", from: json)
            summary = xcOptional(element: "summary", from: json)
            emittedOutput = xcOptional(element: "emittedOutput", from: json)
            performanceTestOutput = xcOptional(element: "performanceTestOutput", from: json)
            testsPassedString = xcOptional(element: "testsPassedString", from: json)
            runnablePath = xcOptional(element: "runnablePath", from: json)
            runnableUTI = xcOptional(element: "runnableUTI", from: json)
        } catch {
            logError("Error parsing ActivityLogUnitTestSection: \(error.localizedDescription)")
            return nil
        }
    }
}
