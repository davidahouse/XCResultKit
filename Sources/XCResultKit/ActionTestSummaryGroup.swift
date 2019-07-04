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
    public let name: XCResultString?
    public let identifier: XCResultString?
    public let duration: XCResultDouble?
    public let subtestGroups: [ActionTestSummaryGroup]
    public let subtests: [ActionTestMetadata]
    
    public init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        identifier = parse(element: "identifier", from: json)
        duration = parse(element: "duration", from: json)
        
        if let jsonSubtests = json["subtests"] as? [String: AnyObject], let actualSubtestsArray = jsonSubtests["_values"] as? [[String: AnyObject]] {
            subtestGroups = actualSubtestsArray.compactMap { ActionTestSummaryGroup($0) }
            subtests = actualSubtestsArray.compactMap { ActionTestMetadata($0) }
        } else {
            subtestGroups = []
            subtests = []
        }
    }
}
