//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestPlanRunSummary
//    * Supertype: ActionAbstractTestSummary
//* Kind: object
//* Properties:
//+ testableSummaries: [ActionTestableSummary]

import Foundation

public struct ActionTestPlanRunSummary: XCResultObject {
    
    public let name: String?

    public let testableSummaries: [ActionTestableSummary]
    
    public init?(_ json: [String: AnyObject]) {
        name = xcOptional(element: "name", from: json)

        testableSummaries = xcArray(element: "testableSummaries", from: json).ofType(ActionTestableSummary.self)
    }
}
