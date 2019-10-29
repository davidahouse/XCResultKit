//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

extension String: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "String" else {
            logError("Incorrect type, expecting String")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            logError("Unable to get string value")
            return nil
        }

        self = actualValue as String
    }
}
