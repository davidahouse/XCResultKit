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
    public let identifier: String?
    public let identifierURL: String?
    public let name: String?
        
    public let duration: Double
    
    public let subtestGroups: [ActionTestSummaryGroup]
    public let subtests: [ActionTestMetadata]
    
    public init?(_ json: [String: AnyObject]) {
        identifier = xcOptional(element: "identifier", from: json)
        identifierURL = xcOptional(element: "identifierURL", from: json)
        name = xcOptional(element: "name", from: json)
        
        duration = xcOptional(element: "duration", from: json) ?? 0.0
        subtestGroups = xcArray(element: "subtests", from: json)
            .ofType(ActionTestSummaryGroup.self)
        subtests = xcArray(element: "subtests", from: json)
            .ofType(ActionTestMetadata.self)
        
    }
}
