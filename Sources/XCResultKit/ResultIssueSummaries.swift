//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ResultIssueSummaries
//    * Kind: object
//* Properties:
//+ analyzerWarningSummaries: [IssueSummary]
//+ errorSummaries: [IssueSummary]
//+ testFailureSummaries: [TestFailureIssueSummary]
//+ warningSummaries: [IssueSummary]

import Foundation

public struct ResultIssueSummaries: XCResultObject {
    public let analyzerWarningSummaries: [IssueSummary]
    public let errorSummaries: [IssueSummary]
    public let testFailureSummaries: [TestFailureIssueSummary]
    public let warningSummaries: [IssueSummary]
    
    public init?(_ json: [String: AnyObject]) {        
        analyzerWarningSummaries = xcArray(element: "analyzerWarningSummaries", from: json).compactMap { IssueSummary($0) }
        errorSummaries = xcArray(element: "errorSummaries", from: json).compactMap { IssueSummary($0) }
        testFailureSummaries = xcArray(element: "testFailureSummaries", from: json).compactMap { TestFailureIssueSummary($0) }
        warningSummaries = xcArray(element: "warningSummaries", from: json).compactMap { IssueSummary($0) }
    }
}
