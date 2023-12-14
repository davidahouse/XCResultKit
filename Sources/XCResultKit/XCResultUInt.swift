//
//  XCResultUInt.swift
//
//
//  Created by Tyler Vick on 7/10/23.
//

import Foundation

extension UInt: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "UInt" else {
            logError("Incorrect type, expecting UInt")
            return nil
        }

        guard let actualValue = json["_value"] as? UInt else {
            logError("Unable to get uint value")
            return nil
        }

        self = actualValue
    }

}

extension UInt8: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "UInt8" else {
            logError("Incorrect type, expecting UInt8")
            return nil
        }

        guard let actualValue = json["_value"] as? UInt8 else {
            logError("Unable to get uint8 value")
            return nil
        }

        self = actualValue
    }

}

extension UInt16: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "UInt16" else {
            logError("Incorrect type, expecting UInt16")
            return nil
        }

        guard let actualValue = json["_value"] as? UInt16 else {
            logError("Unable to get uint16 value")
            return nil
        }

        self = actualValue
    }

}

extension UInt32: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "UInt32" else {
            logError("Incorrect type, expecting UInt32")
            return nil
        }

        guard let actualValue = json["_value"] as? UInt32 else {
            logError("Unable to get uint32 value")
            return nil
        }

        self = actualValue
    }

}

extension UInt64: XCResultObject {

    public init?(_ json: [String: AnyObject]) {
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "UInt64" else {
            logError("Incorrect type, expecting UInt64")
            return nil
        }

        guard let actualValue = json["_value"] as? UInt64 else {
            logError("Unable to get uint64 value")
            return nil
        }

        self = actualValue
    }

}
