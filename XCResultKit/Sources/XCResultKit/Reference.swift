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

struct Reference: XCResultObject {
    let id: XCResultString?
    let targetType: TypeDefinition?
    
    init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Reference" else {
            print("Incorrect type, expecting Reference")
            return nil
        }
        
        id = parse(element: "id", from: json)
        targetType = parse(element: "targetType", from: json)
    }
}
