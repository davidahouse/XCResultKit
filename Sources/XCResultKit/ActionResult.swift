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

public struct ActionResult: XCResultObject {
    public let resultName: XCResultString?
    public let status: XCResultString?
    public let metrics: ResultMetrics?
    public let issues: ResultIssueSummaries?
    public let coverage: CodeCoverageInfo?
    public let timelineRef: Reference?
    public let logRef: Reference?
    public let testsRef: Reference?
    public let diagnosticsRef: Reference?

    public init?(_ json: [String: AnyObject]) {
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "_ActionResult" else {
            print("Incorrect type, expecting ActionResult")
            return nil
        }
        
        resultName = parse(element: "resultName", from: json)
        status = parse(element: "status", from: json)
        metrics = parse(element: "metrics", from: json)
        issues = parse(element: "issues", from: json)
        coverage = parse(element: "coverage", from: json)
        timelineRef = parse(element: "timelineRef", from: json)
        logRef = parse(element: "logRef", from: json)
        testsRef = parse(element: "testsRef", from: json)
        diagnosticsRef = parse(element: "diagnosticsRef", from: json)
    }
}

