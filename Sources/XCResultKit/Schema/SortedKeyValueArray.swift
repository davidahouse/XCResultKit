//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SortedKeyValueArray
//  * Kind: object
//  * Properties:
//    + storage: [SortedKeyValueArrayPair]

public struct SortedKeyValueArray: XCResultObject {
    public let storage: [SortedKeyValueArrayPair]
    
    public init?(_ json: [String: AnyObject]) {
        storage = xcArray(element: "storage", from: json).ofType(SortedKeyValueArrayPair.self)
    }
}
