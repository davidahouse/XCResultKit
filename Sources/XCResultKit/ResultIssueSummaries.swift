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
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "ResultIssueSummaries" else {
            print("Incorrect type, expecting ResultIssueSummaries")
            return nil
        }
        
        if let jsonWarningSummaries = json["analyzerWarningSummaries"] as? [[String: AnyObject]] {
            analyzerWarningSummaries = jsonWarningSummaries.compactMap { IssueSummary($0) }
        } else {
            analyzerWarningSummaries = []
        }
        
        if let jsonErrorSummaries = json["errorSummaries"] as? [[String: AnyObject]] {
            errorSummaries = jsonErrorSummaries.compactMap { IssueSummary($0) }
        } else {
            errorSummaries = []
        }

        if let jsonTestFailureSummaries = json["testFailureSummaries"] as? [[String: AnyObject]] {
            testFailureSummaries = jsonTestFailureSummaries.compactMap { TestFailureIssueSummary($0) }
        } else {
            testFailureSummaries = []
        }
        
        if let jsonWarningSummaries = json["warningSummaries"] as? [[String: AnyObject]] {
            warningSummaries = jsonWarningSummaries.compactMap { IssueSummary($0) }
        } else {
            warningSummaries = []
        }

    }
}
