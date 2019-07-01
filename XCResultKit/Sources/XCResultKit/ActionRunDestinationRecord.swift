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

struct ActionRunDestinationRecord {
    let displayName: String
    let targetArchitecture: String
    let targetDeviceRecord: ActionDeviceRecord
    let localComputerRecord: ActionDeviceRecord
    let targetSDKRecord: ActionSDKRecord
}
