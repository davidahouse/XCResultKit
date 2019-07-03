//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//  - TypeDefinition
//      * Kind: object
//      * Properties:
//      + name: String
//      + supertype: TypeDefinition?

import Foundation

struct TypeDefinition: XCResultObject {
    let name: XCResultString?
    
    init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
    }
}
