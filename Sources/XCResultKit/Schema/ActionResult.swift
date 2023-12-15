//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionResult
//    * Kind: object
//* Properties:
//+ resultName: String
//+ status: String
//+ metrics: ResultMetrics
//+ issues: ResultIssueSummaries
//+ coverage: CodeCoverageInfo
//+ timelineRef: Reference?
//+ logRef: Reference?
//+ testsRef: Reference?
//+ diagnosticsRef: Reference?

import Foundation

public struct ActionResult: XCResultObject {
    public let resultName: String
    public let status: String
    public let metrics: ResultMetrics
    public let issues: ResultIssueSummaries
    public let coverage: CodeCoverageInfo
    public let timelineRef: Reference<GenericReferencedObject>?
    public let logRef: Reference<ActivityLogSection>?
    public let testsRef: Reference<ActionTestPlanRunSummaries>?
    public let diagnosticsRef: Reference<GenericReferencedObject>?
    public let consoleLogRef: Reference<GenericReferencedObject>?

    public init?(_ json: [String: AnyObject]) {
        
        do {
            resultName = try xcRequired(element: "resultName", from: json)
            status = try xcRequired(element: "status", from: json)
            metrics = try xcRequired(element: "metrics", from: json)
            issues = try xcRequired(element: "issues", from: json)
            coverage = try xcRequired(element: "coverage", from: json)
            timelineRef = xcOptional(element: "timelineRef", from: json)
            logRef = xcOptional(element: "logRef", from: json)
            testsRef = xcOptional(element: "testsRef", from: json)
            diagnosticsRef = xcOptional(element: "diagnosticsRef", from: json)
            consoleLogRef = xcOptional(element: "consoleLogRef", from: json)
        } catch {
            logError("Error parsing ActionResult: \(error.localizedDescription)")
            return nil
        }
    }
}
