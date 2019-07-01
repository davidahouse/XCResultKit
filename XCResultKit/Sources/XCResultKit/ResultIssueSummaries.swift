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

struct ResultIssueSummaries {
    let analyzerWarningSummaries: [IssueSummary]
    let errorSummaries: [IssueSummary]
    let testFailureSummaries: [TestFailureIssueSummary]
    let warningSummaries: [IssueSummary]
}
