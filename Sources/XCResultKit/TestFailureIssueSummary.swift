//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- TestFailureIssueSummary
//    * Supertype: IssueSummary
//* Kind: object
//* Properties:
//+ testCaseName: String

import Foundation

public struct TestFailureIssueSummary: XCResultObject {
    public let testCaseName: String
    
    public init?(_ json: [String : AnyObject]) {
        do {
            testCaseName = try xcRequired(element: "testCaseName", from: json)
        } catch {
            print("Error parsing ResultMetrics: \(error.localizedDescription)")
            return nil
        }
    }
}
