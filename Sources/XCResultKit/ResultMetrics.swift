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
    let analyzerWarningCount: XCResultInt?
    let errorCount: XCResultInt?
    let testsCount: XCResultInt?
    let testsFailedCount: XCResultInt?
    let warningCount: XCResultInt?
    
    public init?(_ json: [String: AnyObject]) {
    
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "ResultMetrics" else {
            print("Incorrect type, expecting ResultMetrics")
            return nil
        }
        
        analyzerWarningCount = parse(element: "analyzerWarningCount", from: json)
        errorCount = parse(element: "errorCount", from: json)
        testsCount = parse(element: "testsCount", from: json)
        testsFailedCount = parse(element: "testsFailedCount", from: json)
        warningCount = parse(element: "warningCount", from: json)
    }
}
