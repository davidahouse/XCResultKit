//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionResult
//    * Kind: object
//* Properties:
//+ resultName: String
//+ status: String
//+ metrics: ResultMetrics
//+ issues: ResultIssueSummaries
//+ coverage: CodeCoverageInfo
//+ timelineRef: Reference?
//+ logRef: Reference?
//+ testsRef: Reference?
//+ diagnosticsRef: Reference?

import Foundation

struct ActionResult {
    let resultName: String
    let status: String
    let metrics: ResultMetrics
    let issues: ResultIssueSummaries
    let coverage: CodeCoverageInfo
    let timelineRef: Reference?
    let logRef: Reference?
    let testsRef: Reference?
    let diagnosticsRef: Reference?
}
