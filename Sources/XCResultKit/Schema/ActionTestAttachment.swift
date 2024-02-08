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
    public let uuid: String?
    public let timestamp: Date?
    public let userInfo: SortedKeyValueArray?
    public let lifetime: String
    public let inActivityIdentifier: Int?
    public let filename: String?
    public let payloadRef: Reference<GenericReferencedObject>?
    public let payloadSize: Int?

    public init?(_ json: [String: AnyObject]) {
        do {
            uniformTypeIdentifier = try xcRequired(element: "uniformTypeIdentifier", from: json)
            name = xcOptional(element: "name", from: json)
            uuid = xcOptional(element: "uuid", from: json)
            timestamp = xcOptional(element: "timestamp", from: json)
            lifetime = try xcRequired(element: "lifetime", from: json)
            userInfo = xcOptional(element: "userInfo", from: json)
            inActivityIdentifier = xcOptional(element: "inActivityIdentifier", from: json)
            filename = xcOptional(element: "filename", from: json)
            payloadRef = xcOptional(element: "payloadRef", from: json)
            payloadSize = xcOptional(element: "payloadSize", from: json)
        } catch {
            logError("Error parsing ActionTestAttachment: \(error.localizedDescription)")
            return nil
        }
    }
}
