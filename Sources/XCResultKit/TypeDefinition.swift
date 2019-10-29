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
    public let name: String
    
    public init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
        } catch {
            logError("Error parsing TypeDefinition: \(error.localizedDescription)")
            return nil
        }
    }
}
