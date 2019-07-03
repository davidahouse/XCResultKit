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

struct ActionDeviceRecord: XCResultObject {
    let name: XCResultString?
    let isConcreteDevice: XCResultBool?
    let operatingSystemVersion: XCResultString?
    let operatingSystemVersionWithBuildNumber: XCResultString?
    let nativeArchitecture: XCResultString?
    let modelName: XCResultString?
    let modelCode: XCResultString?
    let modelUTI: XCResultString?
    let identifier: XCResultString?
    let isWireless: XCResultBool?
    let cpuKind: XCResultString?
    let cpuCount: XCResultInt?
    let cpuSpeedInMhz: XCResultInt?
    let busSpeedInMhz: XCResultInt?
    let ramSizeInMegabytes: XCResultInt?
    let physicalCPUCoresPerPackage: XCResultInt?
    let logicalCPUCoresPerPackage: XCResultInt?
    let platformRecord: ActionPlatformRecord?
    
    init?(_ json: [String : AnyObject]) {
        name = parse(element: "name", from: json)
        isConcreteDevice = parse(element: "isConcreteDevice", from: json)
        operatingSystemVersion = parse(element: "operatingSystemVersion", from: json)
        operatingSystemVersionWithBuildNumber = parse(element: "operatingSystemVersionWithBuildNumber", from: json)
        nativeArchitecture = parse(element: "nativeArchitecture", from: json)
        modelName = parse(element: "modelName", from: json)
        modelCode = parse(element: "modelCode", from: json)
        modelUTI = parse(element: "modelUTI", from: json)
        identifier = parse(element: "identifier", from: json)
        isWireless = parse(element: "isWireless", from: json)
        cpuKind = parse(element: "cpuKind", from: json)
        cpuCount = parse(element: "cpuCount", from: json)
        cpuSpeedInMhz = parse(element: "cpuSpeedInMhz", from: json)
        busSpeedInMhz = parse(element: "busSpeedInMhz", from: json)
        ramSizeInMegabytes = parse(element: "ramSizeInMegabytes", from: json)
        physicalCPUCoresPerPackage = parse(element: "physicalCPUCoresPerPackage", from: json)
        logicalCPUCoresPerPackage = parse(element: "logicalCPUCoresPerPackage", from: json)
        platformRecord = parse(element: "platformRecord", from: json)
    }
}
