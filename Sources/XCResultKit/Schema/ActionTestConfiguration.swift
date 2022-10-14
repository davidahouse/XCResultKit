//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

public struct ActionTestConfiguration: XCResultObject {
    public let userInfo: SortedKeyValueArray?

    public init?(_ json: [String: AnyObject]) {
        userInfo = xcOptional(element: "userInfo", from: json)
    }
}
