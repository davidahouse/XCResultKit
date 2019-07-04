//
//  File.swift
//  
//
//  Created by David House on 7/1/19.
//

import Foundation

public struct XCResultInt: XCResultObject {
    public let value: Int
    
    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int" else {
            print("Incorrect type, expecting Int")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get int value")
            return nil
        }
        
        value = actualValue.integerValue
    }
}

extension Int: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int" else {
            print("Incorrect type, expecting Int")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get int value")
            return nil
        }

        self = actualValue.integerValue
    }
}
