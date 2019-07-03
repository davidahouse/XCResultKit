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

struct ActionSDKRecord: XCResultObject {
    let name: XCResultString?
    let identifier: XCResultString?
    let operatingSystemVersion: XCResultString?
    let isInternal: XCResultBool?

    init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        identifier = parse(element: "identifier", from: json)
        operatingSystemVersion = parse(element: "operatingSystemVersion", from: json)
        isInternal = parse(element: "isInternal", from: json)
    }
}
