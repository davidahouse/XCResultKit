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
    public let projectRelativePath: XCResultString?
    public let targetName: XCResultString?
    public let testKind: XCResultString?
    public let tests: [ActionTestSummaryGroup]
    public let diagnosticsDirectoryName: XCResultString?
    public let failureSummaries: [ActionTestFailureSummary]
    public let testLanguage: XCResultString?
    public let testRegion: XCResultString?
    
    public init?(_ json: [String : AnyObject]) {
        projectRelativePath = parse(element: "projectRelativePath", from: json)
        targetName = parse(element: "targetName", from: json)
        testKind = parse(element: "testKind", from: json)

        if let jsonTests = json["tests"] as? [String: AnyObject], let actualTestsArray = jsonTests["_values"] as? [[String: AnyObject]] {
            tests = actualTestsArray.compactMap { ActionTestSummaryGroup($0) }
        } else {
            tests = []
        }

        diagnosticsDirectoryName = parse(element: "diagnosticsDirectoryName", from: json)
        
        if let jsonSummaries = json["failureSummaries"] as? [String: AnyObject], let actualSummariesArray = jsonSummaries["_values"] as? [[String: AnyObject]] {
            failureSummaries = actualSummariesArray.compactMap { ActionTestFailureSummary($0) }
        } else {
            failureSummaries = []
        }
        
        testLanguage = parse(element: "testLanguage", from: json)
        testRegion = parse(element: "testRegion", from: json)
    }
}
