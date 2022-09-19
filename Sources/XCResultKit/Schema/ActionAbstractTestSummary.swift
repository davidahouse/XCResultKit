//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActionAbstractTestSummary
//  * Kind: object
//  * Properties:
//    + name: String?

public struct ActionAbstractTestSummary: XCResultObject, Encodable {
    public let name: String
    
    public init?(_ json: [String: AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
        } catch {
            logError("Error parsing ActionAbstractTestSummary: \(error.localizedDescription)")
            return nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
