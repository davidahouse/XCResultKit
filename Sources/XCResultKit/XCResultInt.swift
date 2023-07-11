//
//  File.swift
//  
//
//  Created by David House on 7/1/19.
//

import Foundation

extension Int: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int" else {
            logError("Incorrect type, expecting Int")
            return nil
        }

        guard let actualValue = json["_value"] as? NSString else {
            logError("Unable to get int value")
            return nil
        }

        self = actualValue.integerValue
    }
}

extension Int8: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int8" else {
            logError("Incorrect type, expecting Int8")
            return nil
        }

        guard let actualValue = json["_value"] as? Int8 else {
            logError("Unable to get int8 value")
            return nil
        }

        self = actualValue
    }

}

extension Int16: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int16" else {
            logError("Incorrect type, expecting Int16")
            return nil
        }

        guard let actualValue = json["_value"] as? Int16 else {
            logError("Unable to get int16 value")
            return nil
        }

        self = actualValue
    }

}

extension Int32: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int32" else {
            logError("Incorrect type, expecting Int32")
            return nil
        }

        guard let actualValue = json["_value"] as? Int32 else {
            logError("Unable to get int32 value")
            return nil
        }

        self = actualValue
    }

}

extension Int64: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "Int64" else {
            logError("Incorrect type, expecting Int64")
            return nil
        }

        guard let actualValue = json["_value"] as? Int64 else {
            logError("Unable to get int64 value")
            return nil
        }

        self = actualValue
    }

}
