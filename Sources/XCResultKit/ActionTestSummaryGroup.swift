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
    public let name: String
    public let identifier: String
    public let duration: Double
    public let subtestGroups: [ActionTestSummaryGroup]
    public let subtests: [ActionTestMetadata]
    
    public init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            duration = try xcRequired(element: "duration", from: json)
            subtestGroups = xcArray(element: "subtests", from: json).compactMap { ActionTestSummaryGroup($0) }
            subtests = xcArray(element: "subtests", from: json).compactMap { ActionTestMetadata($0) }
        } catch {
            debug("Error parsing ActionTestSummaryGroup: \(error.localizedDescription)")
            return nil
        }
    }
}
