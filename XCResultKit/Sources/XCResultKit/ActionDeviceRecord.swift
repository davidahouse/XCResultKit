//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionDeviceRecord
//    * Kind: object
//* Properties:
//+ name: String
//+ isConcreteDevice: Bool
//+ operatingSystemVersion: String
//+ operatingSystemVersionWithBuildNumber: String
//+ nativeArchitecture: String
//+ modelName: String
//+ modelCode: String
//+ modelUTI: String
//+ identifier: String
//+ isWireless: Bool
//+ cpuKind: String
//+ cpuCount: Int?
//+ cpuSpeedInMHz: Int?
//+ busSpeedInMHz: Int?
//+ ramSizeInMegabytes: Int?
//+ physicalCPUCoresPerPackage: Int?
//+ logicalCPUCoresPerPackage: Int?
//+ platformRecord: ActionPlatformRecord

import Foundation

struct ActionDeviceRecord {
    let name: String
    let isConcreteDevice: Bool
    let operatingSystemVersion: String
    let operatingSystemVersionWithBuildNumber: String
    let nativeArchitecture: String
    let modelName: String
    let modelCode: String
    let modelUTI: String
    let identifier: String
    let isWireless: Bool
    let cpuKind: String
    let cpuCount: Int?
    let cpuSpeedInMhz: Int?
    let busSpeedInMhz: Int?
    let ramSizeInMegabytes: Int?
    let physicalCPUCoresPerPackage: Int?
    let logicalCPUCoresPerPackage: Int?
    let platformRecord: ActionPlatformRecord
}
