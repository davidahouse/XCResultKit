//
//  File.swift
//
//
//  Created by David House on 7/1/19.
//

import Foundation

public struct XCResultDate: XCResultObject {
    public let value: String
    
    public init?(_ json: [String: AnyObject]) {
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

extension Date: XCResultObject {

    public static var isoFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Date" else {
            print("Incorrect type, expecting Date")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            print("Unable to get date value")
            return nil
        }

        guard let date = Date.isoFormatter.date(from:actualValue as String) else {
            print("error parsing date")
            return nil
        }

        self = date
    }
}
