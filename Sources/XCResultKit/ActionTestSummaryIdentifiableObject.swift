//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//
//- ActionTestSummaryIdentifiableObject
//    * Supertype: ActionAbstractTestSummary
//* Kind: object
//* Properties:
//+ identifier: String?

import Foundation

public struct ActionTestSummaryIdentifiableObject: XCResultObject {
    public let identifier: XCResultString?
    
    public init?(_ json: [String : AnyObject]) {
        identifier = parse(element: "identifier", from: json)
    }
}
