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

public struct TypeDefinition: XCResultObject {
    public let name: XCResultString?
    
    public init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
    }
}
