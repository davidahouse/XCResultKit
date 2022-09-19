//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- TestAssociatedError
//  * Kind: object
//  * Properties:
//    + domain: String?
//    + code: Int?
//    + userInfo: SortedKeyValueArray?

public struct TestAssociatedError: XCResultObject {
    public let domain: String?
    public let code: Int?
    public let userInfo: SortedKeyValueArray?
    
    public init?(_ json: [String: AnyObject]) {
        domain = xcOptional(element: "domain", from: json)
        code = xcOptional(element: "code", from: json)
        userInfo = xcOptional(element: "userInfo", from: json)
    }
}
