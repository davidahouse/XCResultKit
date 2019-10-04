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

    public init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            testStatus = try xcRequired(element: "testStatus", from: json)
            duration = try xcRequired(element: "duration", from: json)
            performanceMetrics = xcArray(element: "performanceMetrics", from: json).compactMap { ActionTestPerformanceMetricSummary($0) }
            failureSummaries = xcArray(element: "failureSummaries", from: json).compactMap { ActionTestFailureSummary($0) }
            activitySummaries = xcArray(element: "activitySummaries", from: json).compactMap { ActionTestActivitySummary($0) }
        } catch {
            debug("Error parsing ActionTestSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
