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

struct ArchiveInfo: XCResultObject {
    let path: XCResultString?
    
    init?(_ json: [String : AnyObject]) {
        path = parse(element: "path", from: json)
    }
}
