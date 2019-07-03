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

struct ActionRunDestinationRecord: XCResultObject {
    let displayName: XCResultString?
    let targetArchitecture: XCResultString?
    let targetDeviceRecord: ActionDeviceRecord?
    let localComputerRecord: ActionDeviceRecord?
    let targetSDKRecord: ActionSDKRecord?
    
    init?(_ json: [String : AnyObject]) {
        displayName = parse(element: "displayName", from: json)
        targetArchitecture = parse(element: "targetArchitecture", from: json)
        targetDeviceRecord = parse(element: "targetDeviceRecord", from: json)
        localComputerRecord = parse(element: "localComputerRecord", from: json)
        targetSDKRecord = parse(element: "targetSDKRecord", from: json)
    }
}
