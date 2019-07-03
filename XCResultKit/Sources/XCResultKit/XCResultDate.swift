//
//  File.swift
//
//
//  Created by David House on 7/1/19.
//

import Foundation

struct XCResultDate: XCResultObject {
    let value: String
    
    init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Date" else {
            print("Incorrect type, expecting Date")
            return nil
        }
        
        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get int value")
            return nil
        }
        
        value = actualValue as String
    }
}
