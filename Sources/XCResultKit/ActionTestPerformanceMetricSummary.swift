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

struct ActionTestPerformanceMetricSummary: XCResultObject {
    let displayName: String
    let unitOfMeasurement: String
    let measurements: [Double]
    let identifier: String?
    let baselineName: String?
    let baselineAverage: Double?
    let maxPercentRegression: Double?
    let maxPercentRelativeStandardDeviation: Double?
    let maxRegression: Double?
    let maxStandardDeviation: Double?

    init?(_ json: [String : AnyObject]) {
        do {
            displayName = try xcRequired(element: "displayName", from: json)
            unitOfMeasurement = try xcRequired(element: "unitOfMeasurement", from: json)
            measurements = xcArray(element: "measurements", from: json).compactMap { Double($0) }
            identifier = xcOptional(element: "identifier", from: json)
            baselineName = xcOptional(element: "baselineName", from: json)
            baselineAverage = xcOptional(element: "baselineAverage", from: json)
            maxPercentRegression = xcOptional(element: "maxPercentRegression", from: json)
            maxPercentRelativeStandardDeviation = xcOptional(element: "maxPercentRelativeStandardDeviation", from: json)
            maxRegression = xcOptional(element: "maxRegression", from: json)
            maxStandardDeviation = xcOptional(element: "maxStandardDeviation", from: json)
        } catch {
            print("Error parsing ActionTestPerformanceMetricSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
