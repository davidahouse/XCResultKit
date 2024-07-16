//
//  ActionTestSummary.swift
//
//
//  Created by David House on 7/5/19.
//
//  - ActionTestSummary
//    * Supertype: ActionTestSummaryIdentifiableObject
//    * Kind: object
//    * Properties:
//	  + testStatus: String
//	  + duration: Double
//	  + performanceMetrics: [ActionTestPerformanceMetricSummary]
//	  + failureSummaries: [ActionTestFailureSummary]
//	  + expectedFailures: [ActionTestExpectedFailure]
//	  + skipNoticeSummary: ActionTestNoticeSummary?
//	  + activitySummaries: [ActionTestActivitySummary]
//	  + repetitionPolicySummary: ActionTestRepetitionPolicySummary?
//	  + arguments: [TestArgument]
//	  + configuration: ActionTestConfiguration?
//	  + warningSummaries: [ActionTestIssueSummary]
//	  + summary: String?
//	  + documentation: [TestDocumentation]
//	  + trackedIssues: [IssueTrackingMetadata]
//	  + tags: [TestTag]

import Foundation

public struct ActionTestSummary: XCResultObject {
	public let identifier: String?
	public let identifierURL: String?
	public let name: String?
	
	public let testStatus: String
	public let duration: Double
	public let performanceMetrics: [ActionTestPerformanceMetricSummary]
	public let failureSummaries: [ActionTestFailureSummary]
	public let expectedFailures: [ActionTestExpectedFailure]
	public let skipNoticeSummary: ActionTestNoticeSummary?
	public let activitySummaries: [ActionTestActivitySummary]
	public let repetitionPolicySummary: ActionTestRepetitionPolicySummary?
	public let arguments: [TestArgument]?
	public let configuration: ActionTestConfiguration?
	public let warningSummaries: [ActionTestIssueSummary]
	public let summary: String?
	public let documentation: [TestDocumentation]
	public let trackedIssues: [IssueTrackingMetadata]?
	public let tags: [TestTag]?


	public init?(_ json: [String: AnyObject]) {
		do {
			identifier = xcOptional(element: "identifier", from: json)
			identifierURL = xcOptional(element: "identifierURL", from: json)
			name = xcOptional(element: "name", from: json)
			
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
			arguments = xcArray(element: "arguments", from: json)
				.ofType(TestArgument.self)
			configuration = xcOptional(element: "configuration", from: json)
			warningSummaries = xcArray(element: "warningSummaries", from: json)
				.ofType(ActionTestIssueSummary.self)
			summary = xcOptional(element: "summary", from: json)
			documentation = xcArray(element: "documentation", from: json)
				.ofType(TestDocumentation.self)
			trackedIssues = xcArray(element: "trackedIssues", from: json)
				.ofType(IssueTrackingMetadata.self)
			tags = xcArray(element: "tags", from: json)
				.ofType(TestTag.self)
			
		} catch {
			logError("Error parsing ActionTestSummary: \(error.localizedDescription)")
			return nil
		}
	}
}
