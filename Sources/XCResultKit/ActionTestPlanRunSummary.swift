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

public struct ActionTestPlanRunSummary: ActionAbstractTestSummary, XCResultObject {
    public var name: XCResultString?
    public let testableSummaries: [ActionTestableSummary]
    
    public init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        
        if let jsonSummaries = json["testableSummaries"] as? [String: AnyObject], let actualSummariesArray = jsonSummaries["_values"] as? [[String: AnyObject]] {
            testableSummaries = actualSummariesArray.compactMap { ActionTestableSummary($0) }
        } else {
            testableSummaries = []
        }
    }
}
