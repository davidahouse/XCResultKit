//
//  ActionTestSummary.swift
//  
//
//  Created by David House on 7/5/19.
//
//- ActionTestSummary
//    * Supertype: ActionTestSummaryIdentifiableObject
//* Kind: object
//* Properties:
//+ testStatus: String
//+ duration: Double
//+ performanceMetrics: [ActionTestPerformanceMetricSummary]
//+ failureSummaries: [ActionTestFailureSummary]
//+ activitySummaries: [ActionTestActivitySummary]

import Foundation

public struct ActionTestSummary: XCResultObject {

    public let testStatus: String
    public let duration: Double
    public let performanceMetrics: [ActionTestPerformanceMetricSummary]
    public let failureSummaries: [ActionTestFailureSummary]
    public let expectedFailures: [ActionTestExpectedFailure]
    public let skipNoticeSummary: ActionTestNoticeSummary?
    public let activitySummaries: [ActionTestActivitySummary]
    public let repetitionPolicySummary: ActionTestRepetitionPolicySummary?
    public let configuration: ActionTestConfiguration?
    
    public init?(_ json: [String: AnyObject]) {
        do {
            testStatus = try xcRequired(element: "testStatus", from: json)
            duration = xcOptional(element: "duration", from: json) ?? 0
            performanceMetrics = xcArray(element: "performanceMetrics", from: json)
                .ofType(ActionTestPerformanceMetricSummary.self)
            failureSummaries = xcArray(element: "failureSummaries", from: json)
                .ofType(ActionTestFailureSummary.self)
            expectedFailures = xcArray(element: "expectedFailures", from: json).ofType(ActionTestExpectedFailure.self)
            skipNoticeSummary = xcOptional(element: "skipNoticeSummary", from: json)
            activitySummaries = xcArray(element: "activitySummaries", from: json)
                .ofType(ActionTestActivitySummary.self)
            repetitionPolicySummary = xcOptional(element: "repetitionPolicySummary", from: json)
            configuration = xcOptional(element: "configuration", from: json)
        } catch {
            logError("Error parsing ActionTestSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
