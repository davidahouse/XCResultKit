//
//  ActionTestAttachment.swift
//  
//
//  Created by David House on 7/5/19.
//
//- ActionTestAttachment
//    * Kind: object
//* Properties:
//+ uniformTypeIdentifier: String
//+ name: String?
//+ timestamp: Date?
//+ userInfo: SortedKeyValueArray?
//+ lifetime: String
//+ inActivityIdentifier: Int
//+ filename: String?
//+ payloadRef: Reference?
//+ payloadSize: Int

import Foundation

public struct ActionTestAttachment: XCResultObject {
    public let uniformTypeIdentifier: String
    public let name: String?
    public let timestamp: Date?
    // TODO: userInfo
    public let lifetime: String
    public let inActivityIdentifier: Int
    public let filename: String?
    public let payloadRef: Reference?
    public let payloadSize: Int

    public init?(_ json: [String : AnyObject]) {
        do {
            uniformTypeIdentifier = try xcRequired(element: "uniformTypeIdentifier", from: json)
            name = xcOptional(element: "name", from: json)
            timestamp = xcOptional(element: "timestamp", from: json)
            lifetime = try xcRequired(element: "lifetime", from: json)
            inActivityIdentifier = try xcRequired(element: "inActivityIdentifier", from: json)
            filename = xcOptional(element: "filename", from: json)
            payloadRef = xcOptional(element: "payloadRef", from: json)
            payloadSize = try xcRequired(element: "payloadSize", from: json)
        } catch {
            debug("Error parsing ActionTestAttachment: \(error.localizedDescription)")
            return nil
        }
    }
}
