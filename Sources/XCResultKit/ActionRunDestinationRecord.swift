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
    public let displayName: XCResultString?
    public let targetArchitecture: XCResultString?
    public let targetDeviceRecord: ActionDeviceRecord?
    public let localComputerRecord: ActionDeviceRecord?
    public let targetSDKRecord: ActionSDKRecord?
    
    public init?(_ json: [String : AnyObject]) {
        displayName = parse(element: "displayName", from: json)
        targetArchitecture = parse(element: "targetArchitecture", from: json)
        targetDeviceRecord = parse(element: "targetDeviceRecord", from: json)
        localComputerRecord = parse(element: "localComputerRecord", from: json)
        targetSDKRecord = parse(element: "targetSDKRecord", from: json)
    }
}
