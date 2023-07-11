//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
// - ResultIssueSummaries
// * Kind: object
// * Properties:
//     + analyzerWarningSummaries: [IssueSummary]
//     + errorSummaries: [IssueSummary]
//     + testFailureSummaries: [TestFailureIssueSummary]
//     + warningSummaries: [IssueSummary]
//     + testWarningSummaries: [TestIssueSummary]

import Foundation

public struct ResultIssueSummaries: XCResultObject {
    public let analyzerWarningSummaries: [IssueSummary]
    public let errorSummaries: [IssueSummary]
    public let testFailureSummaries: [TestFailureIssueSummary]
    public let warningSummaries: [IssueSummary]
    public let testWarningSummaries: [TestIssueSummary]
    
    public init?(_ json: [String: AnyObject]) {        
        analyzerWarningSummaries = xcArray(element: "analyzerWarningSummaries", from: json).ofType(IssueSummary.self)
        errorSummaries = xcArray(element: "errorSummaries", from: json).ofType(IssueSummary.self)
        testFailureSummaries = xcArray(element: "testFailureSummaries", from: json).ofType(TestFailureIssueSummary.self)
        warningSummaries = xcArray(element: "warningSummaries", from: json).ofType(IssueSummary.self)
        testWarningSummaries = xcArray(element: "testWarningSummaries", from: json).ofType(TestIssueSummary.self)
    }
}
