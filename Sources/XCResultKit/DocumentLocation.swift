//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- DocumentLocation
//    * Kind: object
//* Properties:
//+ url: String
//+ concreteTypeName: String

import Foundation

public struct DocumentLocation: XCResultObject {
    public let url: String
    public let concreteTypeName: String
    
    public init?(_ json: [String : AnyObject]) {
        
        do {
            url = try xcRequired(element: "url", from: json)
            concreteTypeName = try xcRequired(element: "concreteTypeName", from: json)
        } catch {
            debug("Error parsing DocumentLocation: \(error.localizedDescription)")
            return nil
        }
    }
}
