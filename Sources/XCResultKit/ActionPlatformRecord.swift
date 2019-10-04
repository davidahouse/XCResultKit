//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionPlatformRecord
//    * Kind: object
//* Properties:
//+ identifier: String
//+ userDescription: String

import Foundation

public struct ActionPlatformRecord: XCResultObject {
    public let identifier: String
    public let userDescription: String
    
    public init?(_ json: [String : AnyObject]) {
        do {
            identifier = try xcRequired(element: "identifier", from: json)
            userDescription = try xcRequired(element: "userDescription", from: json)
        } catch {
            debug("Error parsing ActionPlatformRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
