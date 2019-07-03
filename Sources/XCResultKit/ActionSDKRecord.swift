//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionSDKRecord
//    * Kind: object
//* Properties:
//+ name: String
//+ identifier: String
//+ operatingSystemVersion: String
//+ isInternal: Bool

import Foundation

public struct ActionSDKRecord: XCResultObject {
    public let name: XCResultString?
    public let identifier: XCResultString?
    public let operatingSystemVersion: XCResultString?
    public let isInternal: XCResultBool?

    public init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        identifier = parse(element: "identifier", from: json)
        operatingSystemVersion = parse(element: "operatingSystemVersion", from: json)
        isInternal = parse(element: "isInternal", from: json)
    }
}
