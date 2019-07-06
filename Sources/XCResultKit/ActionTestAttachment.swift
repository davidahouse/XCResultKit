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

struct ActionTestAttachment: XCResultObject {
    let uniformTypeIdentifier: String
    let name: String?
    let timestamp: Date?
    // TODO: userInfo
    let lifetime: String
    let inActivityIdentifier: Int
    let filename: String?
    let payloadRef: Reference?
    let payloadSize: Int

    init?(_ json: [String : AnyObject]) {
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
            print("Error parsing ActionTestAttachment: \(error.localizedDescription)")
            return nil
        }
    }
}
