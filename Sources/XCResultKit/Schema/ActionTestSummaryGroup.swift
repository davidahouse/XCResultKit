//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestSummaryGroup
//    * Supertype: ActionTestSummaryIdentifiableObject
//* Kind: object
//* Properties:
//+ duration: Double
//+ subtests: [ActionTestSummaryIdentifiableObject]

import Foundation

public struct ActionTestSummaryGroup: XCResultObject {
    public let duration: Double
    public let subtests: [ActionTestMetadata]
    
    public init?(_ json: [String: AnyObject]) {
        duration = xcOptional(element: "duration", from: json) ?? 0.0
        subtests = xcArray(element: "subtests", from: json)
            .ofType(ActionTestMetadata.self)
        
    }
}
