//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestFailureSummary
//    * Kind: object
//* Properties:
//+ message: String?
//+ fileName: String
//+ lineNumber: Int
//+ isPerformanceFailure: Bool

import Foundation

public struct ActionTestFailureSummary: XCResultObject {
    public let message: String?
    public let fileName: String
    public let lineNumber: Int
    public let isPerformanceFailure: Bool
    
    public init?(_ json: [String : AnyObject]) {
        
        do {
            message = xcOptional(element: "message", from: json)
            fileName = try xcRequired(element: "fileName", from: json)
            lineNumber = try xcRequired(element: "lineNumber", from: json)
            isPerformanceFailure = try xcRequired(element: "isPerformanceFailure", from: json)
        } catch {
            print("Error parsing ActionTestFailureSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
