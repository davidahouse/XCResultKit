//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SortedKeyValueArrayPair
//    * Kind: object
//    * Properties:
//      + key: String
//      + value: SchemaSerializable

public struct SortedKeyValueArrayPair: XCResultObject {
    public let key: String
    // public let value: SchemaSerializable
    
    public init?(_ json: [String: AnyObject]) {
        do {
            key = try xcRequired(element: "key", from: json)
        } catch {
            logError("Error parsing SortedKeyValueArrayPair: \(error.localizedDescription)")
            return nil
        }
    }
}
