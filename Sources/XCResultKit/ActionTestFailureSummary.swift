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
    public let message: XCResultString?
    public let fileName: XCResultString?
    public let lineNumber: XCResultInt?
    public let isPerformanceFailure: XCResultBool?
    
    public init?(_ json: [String : AnyObject]) {
        message = parse(element: "message", from: json)
        fileName = parse(element: "fileName", from: json)
        lineNumber = parse(element: "lineNumber", from: json)
        isPerformanceFailure = parse(element: "isPerformanceFailure", from: json)
    }
}
