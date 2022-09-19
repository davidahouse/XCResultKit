//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActionTestSummaryIdentifiableObject
//  * Supertype: ActionAbstractTestSummary
//  * Kind: object
//  * Properties:
//    + identifier: String?
//    + identifierURL: String?

public struct ActionTestSummaryIdentifiableObject: XCResultObject {
    public let identifier: String?
    public let identifierURL: String?

    public init?(_ json: [String: AnyObject]) {
        identifier = xcOptional(element: "identifier", from: json)
        identifierURL = xcOptional(element: "identifierURL", from: json)
    }
}
