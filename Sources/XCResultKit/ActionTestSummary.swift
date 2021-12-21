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

    public let name: String
    public let identifier: String
    public let testStatus: String
    public let duration: Double
    public let performanceMetrics: [ActionTestPerformanceMetricSummary]
    public let failureSummaries: [ActionTestFailureSummary]
    public let activitySummaries: [ActionTestActivitySummary]
    public let repetitionPolicySummary: ActionTestRepetitionPolicySummary?

    public init?(_ json: [String: AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            testStatus = try xcRequired(element: "testStatus", from: json)
            duration = xcOptional(element: "duration", from: json) ?? 0
            performanceMetrics = xcArray(element: "performanceMetrics", from: json)
                .ofType(ActionTestPerformanceMetricSummary.self)
            failureSummaries = xcArray(element: "failureSummaries", from: json)
                .ofType(ActionTestFailureSummary.self)
            activitySummaries = xcArray(element: "activitySummaries", from: json)
                .ofType(ActionTestActivitySummary.self)
            repetitionPolicySummary = xcOptional(element: "repetitionPolicySummary", from: json)
        } catch {
            logError("Error parsing ActionTestSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
