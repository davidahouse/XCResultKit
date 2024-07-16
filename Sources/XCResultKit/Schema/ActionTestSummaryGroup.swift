//
//  ActionTestSummaryGroup.swift
//
//
//  Created by David House on 7/3/19.
//
//- ActionTestSummaryGroup
//    * Supertype: ActionTestSummaryIdentifiableObject
//* Kind: object
//* Properties:
//+ duration: Double
//+ subtests: [ActionTestSummaryIdentifiableObject]
//+ skipNoticeSummary: ActionTestNoticeSummary?
//+ summary: String?
//+ documentation: [TestDocumentation]
//+ trackedIssues: [IssueTrackingMetadata]
//+ tags: [TestTag]
//
// Note that the actual json differs from the schema definition, the type is different for subtests, and subtestGroups does not exist in the schema
import Foundation

public class ActionTestSummaryGroup: XCResultObject {
	public let identifier: String?
	public let identifierURL: String?
	public let name: String?
		
	public let duration: Double
	
	public let subtests: [ActionTestMetadata]
	public let subtestGroups: [ActionTestSummaryGroup]
	public let skipNoticeSummary: ActionTestNoticeSummary?
	
	public let summary: String?
	public let trackedIssues: [IssueTrackingMetadata]?
	public let tags: [TestTag]?
	public let documentation: [TestDocumentation]

	required public init?(_ json: [String: AnyObject]) {
		identifier = xcOptional(element: "identifier", from: json)
		identifierURL = xcOptional(element: "identifierURL", from: json)
		name = xcOptional(element: "name", from: json)
		
		duration = xcOptional(element: "duration", from: json) ?? 0.0
		subtestGroups = xcArray(element: "subtests", from: json)
			.ofType(ActionTestSummaryGroup.self)
		subtests = xcArray(element: "subtests", from: json)
			.ofType(ActionTestMetadata.self)
		skipNoticeSummary = xcOptional(element: "skipNoticeSummary", from: json)
		summary = xcOptional(element: "summary", from: json)
		documentation = xcArray(element: "documentation", from: json)
			.ofType(TestDocumentation.self)
		trackedIssues = xcArray(element: "trackedIssues", from: json)
			.ofType(IssueTrackingMetadata.self)
		tags = xcArray(element: "tags", from: json)
			.ofType(TestTag.self)
	}
}
