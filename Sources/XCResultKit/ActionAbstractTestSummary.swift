//
//  ActionAbstractTestSummary.swift
//  
//
//  Created by David House on 10/5/21.
//
//   - ActionAbstractTestSummary
//      * Kind: object
//      * Properties:
//          + name: String?

import Foundation

public struct ActionAbstractTestSummary: XCResultObject, Encodable {
    public let name: String?
    
    public init?(_ json: [String: AnyObject]) {
        name = xcOptional(element: "name", from: json)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
