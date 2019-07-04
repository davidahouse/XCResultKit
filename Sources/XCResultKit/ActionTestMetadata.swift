//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestMetadata
//    * Supertype: ActionTestSummaryIdentifiableObject
//* Kind: object
//* Properties:
//+ testStatus: String
//+ duration: Double?
//+ summaryRef: Reference?
//+ performanceMetricsCount: Int
//+ failureSummariesCount: Int
//+ activitySummariesCount: Int

import Foundation

public struct ActionTestMetadata: XCResultObject {
    public let name: XCResultString?
    public let identifier: XCResultString?
    public let testStatus: XCResultString?
    public let duration: XCResultDouble?
    public let summaryRef: Reference?
    public let performanceMetricsCount: XCResultInt?
    public let failureSummariesCount: XCResultInt?
    public let activitySummariesCount: XCResultInt?
    
    public init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        identifier = parse(element: "identifier", from: json)
        testStatus = parse(element: "testStatus", from: json)
        duration = parse(element: "duration", from: json)
        summaryRef = parse(element: "summaryRef", from: json)
        performanceMetricsCount = parse(element: "performanceMetricsCount", from: json)
        failureSummariesCount = parse(element: "failureSummariesCount", from: json)
        activitySummariesCount = parse(element: "activitySummariesCount", from: json)
    }
}
