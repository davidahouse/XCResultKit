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
    public let fileName: String?
    public let lineNumber: Int
    public let isPerformanceFailure: Bool
    
    public init(_ json: [String: AnyObject]) {        
		message = xcOptional(element: "message", from: json)
		fileName = xcOptional(element: "fileName", from: json)
		lineNumber = xcOptional(element: "lineNumber", from: json) ?? 0
		isPerformanceFailure = xcOptional(element: "isPerformanceFailure", from: json) ?? false
    }
}
