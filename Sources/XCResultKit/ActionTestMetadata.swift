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
    public let name: String
    public let identifier: String
    public let testStatus: String
    public let duration: Double?
    public let summaryRef: Reference?
    public let performanceMetricsCount: Int?
    public let failureSummariesCount: Int?
    public let activitySummariesCount: Int?
    
    public init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            testStatus = try xcRequired(element: "testStatus", from: json)
            duration = xcOptional(element: "duration", from: json)
            summaryRef = xcOptional(element: "summaryRef", from: json)
            performanceMetricsCount = xcOptional(element: "performanceMetricsCount", from: json)
            failureSummariesCount = xcOptional(element: "failureSummariesCount", from: json)
            activitySummariesCount = xcOptional(element: "activitySummariesCount", from: json)
        } catch {
            print("Error parsing ActionTestMetadata: \(error.localizedDescription)")
            return nil
        }
    }
}
