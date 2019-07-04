//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//

import Foundation

public struct XCResultDouble: XCResultObject {
    public let value: Double
    
    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Double" else {
            print("Incorrect type, expecting Int")
            return nil
        }
        
        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get double value")
            return nil
        }
        
        value = actualValue.doubleValue
    }
}
