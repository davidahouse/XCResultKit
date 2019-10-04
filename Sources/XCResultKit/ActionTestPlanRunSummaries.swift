//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestPlanRunSummaries
//    * Kind: object
//* Properties:
//+ summaries: [ActionTestPlanRunSummary]

import Foundation

public struct ActionTestPlanRunSummaries: XCResultObject {
    public let summaries: [ActionTestPlanRunSummary]
    
    public init?(_ json: [String : AnyObject]) {        
        summaries = xcArray(element: "summaries", from: json).ofType(ActionTestPlanRunSummary.self)
    }
}
