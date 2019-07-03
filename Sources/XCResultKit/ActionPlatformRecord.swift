//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionPlatformRecord
//    * Kind: object
//* Properties:
//+ identifier: String
//+ userDescription: String

import Foundation

public struct ActionPlatformRecord: XCResultObject {
    let identifier: XCResultString?
    let userDescription: XCResultString?
    
    public init?(_ json: [String : AnyObject]) {
        identifier = parse(element: "identifier", from: json)
        userDescription = parse(element: "userDescription", from: json)
    }
}
