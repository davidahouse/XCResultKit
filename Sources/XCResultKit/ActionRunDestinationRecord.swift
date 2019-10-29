//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionRunDestinationRecord
//    * Kind: object
//* Properties:
//+ displayName: String
//+ targetArchitecture: String
//+ targetDeviceRecord: ActionDeviceRecord
//+ localComputerRecord: ActionDeviceRecord
//+ targetSDKRecord: ActionSDKRecord

import Foundation

public struct ActionRunDestinationRecord: XCResultObject {
    public let displayName: String
    public let targetArchitecture: String
    public let targetDeviceRecord: ActionDeviceRecord
    public let localComputerRecord: ActionDeviceRecord
    public let targetSDKRecord: ActionSDKRecord
    
    public init?(_ json: [String : AnyObject]) {
        
        do {
            displayName = try xcRequired(element: "displayName", from: json)
            targetArchitecture = try xcRequired(element: "targetArchitecture", from: json)
            targetDeviceRecord = try xcRequired(element: "targetDeviceRecord", from: json)
            localComputerRecord = try xcRequired(element: "localComputerRecord", from: json)
            targetSDKRecord = try xcRequired(element: "targetSDKRecord", from: json)
        } catch {
            logError("Error parsing ActionRunDestinationRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
