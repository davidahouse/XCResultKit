//
//  ActionTestPerformanceMetricSummary.swift
//  
//
//  Created by David House on 7/5/19.
//
//- ActionTestPerformanceMetricSummary
//    * Kind: object
//* Properties:
//+ displayName: String
//+ unitOfMeasurement: String
//+ measurements: [Double]
//+ identifier: String?
//+ baselineName: String?
//+ baselineAverage: Double?
//+ maxPercentRegression: Double?
//+ maxPercentRelativeStandardDeviation: Double?
//+ maxRegression: Double?
//+ maxStandardDeviation: Double?

import Foundation

public struct ActionTestPerformanceMetricSummary: XCResultObject {
    public let displayName: String
    public let unitOfMeasurement: String
    public let measurements: [Double]
    public let identifier: String?
    public let baselineName: String?
    public let baselineAverage: Double?
    public let maxPercentRegression: Double?
    public let maxPercentRelativeStandardDeviation: Double?
    public let maxRegression: Double?
    public let maxStandardDeviation: Double?

    public init?(_ json: [String : AnyObject]) {
        do {
            displayName = try xcRequired(element: "displayName", from: json)
            unitOfMeasurement = try xcRequired(element: "unitOfMeasurement", from: json)
            measurements = xcArray(element: "measurements", from: json).ofType(Double.self)
            identifier = xcOptional(element: "identifier", from: json)
            baselineName = xcOptional(element: "baselineName", from: json)
            baselineAverage = xcOptional(element: "baselineAverage", from: json)
            maxPercentRegression = xcOptional(element: "maxPercentRegression", from: json)
            maxPercentRelativeStandardDeviation = xcOptional(element: "maxPercentRelativeStandardDeviation", from: json)
            maxRegression = xcOptional(element: "maxRegression", from: json)
            maxStandardDeviation = xcOptional(element: "maxStandardDeviation", from: json)
        } catch {
            debug("Error parsing ActionTestPerformanceMetricSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
