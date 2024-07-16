//
//  File.swift
//
//
//  Created by David House on 7/3/19.
//
//- ActionTestableSummary
//    * Supertype: ActionAbstractTestSummary
//* Kind: object
//* Properties:
//+ projectRelativePath: String?
//+ targetName: String?
//+ testKind: String?
//+ tests: [ActionTestSummaryIdentifiableObject]
//+ diagnosticsDirectoryName: String?
//+ failureSummaries: [ActionTestFailureSummary]
//+ testLanguage: String?
//+ testRegion: String?

import Foundation

public struct ActionTestableSummary: XCResultObject {
	public let name: String?
	public let identifierURL: String?
	public let projectRelativePath: String?
	public let targetName: String?
	public let testKind: String?
	public let tests: [ActionTestSummaryGroup]
	//Note that this is a "synthetic" property, the actual global tests are coming interspersed in the tests array (yuck, mixing types in the same array)
	public let globalTests: [ActionTestMetadata]
	public let diagnosticsDirectoryName: String?
	public let failureSummaries: [ActionTestFailureSummary]
	public let testLanguage: String?
	public let testRegion: String?
	
	public init?(_ json: [String: AnyObject]) {
		name = xcOptional(element: "name", from: json)
		identifierURL = xcOptional(element: "identifierURL", from: json)
		projectRelativePath = xcOptional(element: "projectRelativePath", from: json)
		targetName = xcOptional(element: "targetName", from: json)
		testKind = xcOptional(element: "testKind", from: json)
		
		//This is messed up, but in the case where we have global function Swift Tests (new in Xcode 16), there appears to a missing level in the data we are getting
		//ActionTestableSummary is supposed to have an array of ActionTestSummaryGroup, but it appears they are instead ActionTestMetadata, and that these will be mixed with ActionTestSummaryGroups.  Ugh.
		//The result of this that if we do nothing the global tests just won't parse and are dropped.
		//Consider filing this as a bug with Apple...
		let testsJson = xcArray(element: "tests", from: json)
		tests = testsJson.ofType(ActionTestSummaryGroup.self)
		globalTests = testsJson.ofType(ActionTestMetadata.self)
		
		diagnosticsDirectoryName = xcOptional(element: "diagnosticsDirectoryName", from: json)
		failureSummaries = xcArray(element: "failureSummaries", from: json).ofType(ActionTestFailureSummary.self)
		testLanguage = xcOptional(element: "testLanguage", from: json)
		testRegion = xcOptional(element: "testRegion", from: json)
	}
}
