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

public struct ActionDeviceRecord: XCResultObject {
    public let name: String
    public let isConcreteDevice: XCResultBool?
    public let operatingSystemVersion: XCResultString?
    public let operatingSystemVersionWithBuildNumber: XCResultString?
    public let nativeArchitecture: XCResultString?
    public let modelName: XCResultString?
    public let modelCode: XCResultString?
    public let modelUTI: XCResultString?
    public let identifier: XCResultString?
    public let isWireless: XCResultBool?
    public let cpuKind: XCResultString?
    public let cpuCount: XCResultInt?
    public let cpuSpeedInMhz: XCResultInt?
    public let busSpeedInMhz: XCResultInt?
    public let ramSizeInMegabytes: XCResultInt?
    public let physicalCPUCoresPerPackage: XCResultInt?
    public let logicalCPUCoresPerPackage: XCResultInt?
    public let platformRecord: ActionPlatformRecord?
    
    public init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
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
        } catch {
            print("Error initializing from json: \(error.localizedDescription)")
            return nil
        }
    }
}
