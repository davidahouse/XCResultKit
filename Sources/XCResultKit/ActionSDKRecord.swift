//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionSDKRecord
//    * Kind: object
//* Properties:
//+ name: String
//+ identifier: String
//+ operatingSystemVersion: String
//+ isInternal: Bool

import Foundation

public struct ActionSDKRecord: XCResultObject {
    public let name: String
    public let identifier: String
    public let operatingSystemVersion: String
    public let isInternal: Bool?

    public init?(_ json: [String: AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            operatingSystemVersion = try xcRequired(element: "operatingSystemVersion", from: json)
            isInternal = xcOptional(element: "isInternal", from: json)
        } catch {
            logError("Error parsing ActionSDKRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
