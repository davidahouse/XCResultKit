//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ArchiveInfo
//    * Kind: object
//* Properties:
//+ path: String?

import Foundation

public struct ArchiveInfo: XCResultObject {
    public let path: String?
    
    public init?(_ json: [String : AnyObject]) {
        path = xcOptional(element: "path", from: json)
    }
}
