//
//  File.swift
//  
//
//  Created by David House on 7/3/19.
//

import Foundation

extension Double: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Double" else {
            debug("Incorrect type, expecting Double")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            debug("Unable to get double value")
            return nil
        }

        self = actualValue.doubleValue
    }
}
