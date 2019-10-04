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
    public let projectRelativePath: String?
    public let targetName: String?
    public let testKind: String?
    public let tests: [ActionTestSummaryGroup]
    public let diagnosticsDirectoryName: String?
    public let failureSummaries: [ActionTestFailureSummary]
    public let testLanguage: String?
    public let testRegion: String?
    
    public init?(_ json: [String : AnyObject]) {        
        projectRelativePath = xcOptional(element: "projectRelativePath", from: json)
        targetName = xcOptional(element: "targetName", from: json)
        testKind = xcOptional(element: "testKind", from: json)
        tests = xcArray(element: "tests", from: json).ofType(ActionTestSummaryGroup.self)
        diagnosticsDirectoryName = xcOptional(element: "diagnosticsDirectoryName", from: json)
        failureSummaries = xcArray(element: "failureSummaries", from: json).ofType(ActionTestFailureSummary.self)
        testLanguage = xcOptional(element: "testLanguage", from: json)
        testRegion = xcOptional(element: "testRegion", from: json)
    }
}
