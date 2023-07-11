//
//  ConsoleLogItemLogData.swift
//
//
//  Created by Tyler Vick on 7/10/23.
//
// - ConsoleLogItemLogData
// * Kind: object
// * Properties:
//     + message: String?
//     + subsystem: String?
//     + category: String?
//     + library: String?
//     + format: String?
//     + backtrace: String?
//     + pid: Int32
//     + processName: String?
//     + sessionUUID: String?
//     + tid: UInt64
//     + messageType: UInt8
//     + senderImagePath: String?
//     + senderImageUUID: String?
//     + senderImageOffset: UInt64
//     + unixTimeInterval: Double
//     + timeZone: String?

import Foundation

public struct ConsoleLogItemLogData: XCResultObject {

    public let message: String?
    public let subsystem: String?
    public let category: String?
    public let library: String?
    public let format: String?
    public let backtrace: String?
    public let pid: Int32
    public let processName: String?
    public let sessionUUID: String?
    public let tid: UInt64
    public let messageType: UInt8
    public let senderImagePath: String?
    public let senderImageUUID: String?
    public let senderImageOffset: UInt64
    public let unixTimeInterval: Double
    public let timeZone: String?

    public init?(_ json: [String: AnyObject]) {
        do {
            message = xcOptional(element: "message", from: json)
            subsystem = xcOptional(element: "subsystem", from: json)
            category = xcOptional(element: "category", from: json)
            library = xcOptional(element: "library", from: json)
            format = xcOptional(element: "format", from: json)
            backtrace = xcOptional(element: "backtrace", from: json)
            pid = try xcRequired(element: "pid", from: json)
            processName = xcOptional(element: "processName", from: json)
            sessionUUID = xcOptional(element: "sessionUUID", from: json)
            tid = try xcRequired(element: "tid", from: json)
            messageType = try xcRequired(element: "messageType", from: json)
            senderImagePath = xcOptional(element: "senderImagePath", from: json)
            senderImageUUID = xcOptional(element: "senderImageUUID", from: json)
            senderImageOffset = try xcRequired(element: "senderImageOffset", from: json)
            unixTimeInterval = try xcRequired(element: "unixTimeInterval", from: json)
            timeZone = xcOptional(element: "timeZone", from: json)
        } catch {
            logError("Error parsing ConsoleLogItemLogData: \(error.localizedDescription)")
            return nil
        }
    }
}
