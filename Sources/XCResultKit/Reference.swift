//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//  Version: 3.19
//
//  - Reference
//      * Kind: object
//      * Properties:
//      + id: String
//      + targetType: TypeDefinition?

import Foundation

public struct Reference: XCResultObject {
    public let id: String
    public let targetType: TypeDefinition?
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            id = try xcRequired(element: "id", from: json)
            targetType = xcOptional(element: "targetType", from: json)
        } catch {
            print("Error parsing Reference: \(error.localizedDescription)")
            return nil
        }
    }
}
