//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ResultMetrics
//    * Kind: object
//* Properties:
//+ analyzerWarningCount: Int
//+ errorCount: Int
//+ testsCount: Int
//+ testsFailedCount: Int
//+ warningCount: Int

import Foundation

public struct ResultMetrics: XCResultObject {
    public let analyzerWarningCount: Int?
    public let errorCount: Int?
    public let testsCount: Int?
    public let testsFailedCount: Int?
    public let warningCount: Int?
    public let testsSkippedCount: Int?
    
    public init?(_ json: [String: AnyObject]) {    
        analyzerWarningCount = xcOptional(element: "analyzerWarningCount", from: json)
        errorCount = xcOptional(element: "errorCount", from: json)
        testsCount = xcOptional(element: "testsCount", from: json)
        testsFailedCount = xcOptional(element: "testsFailedCount", from: json)
        warningCount = xcOptional(element: "warningCount", from: json)
        testsSkippedCount = xcOptional(element: "testsSkippedCount", from: json)
    }
}
