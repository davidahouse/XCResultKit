//
//  File.swift
//
//
//  Created by David House on 7/1/19.
//

import Foundation

extension Bool: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Bool" else {
            print("Incorrect type, expecting Bool")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get bool value")
            return nil
        }

        self = actualValue.boolValue
    }
}
