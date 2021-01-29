//
//  File.swift
//  
//
//  Created by David House on 1/24/21.
//

import Foundation

/// LogStoreExecution represents the details for a single test execution from Xcode
struct LogStoreExecution {
    let auxiliaryLogUniqueIdentifier: String
    let auxiliaryObservable: [String: String]
    let className: String
    let documentTypeString: String
    let domainType: String
    let fileName: String
    let hasAuxiliaryLog: Bool
    let hasCoverageData: Bool
    let hasPrimaryLog: Bool
    let primaryObservable: [String: String]
    let schemeIdentifierContainerName: String
    let schemeIdentifierSchemeName: String
    let schemeIdentifierSharedScheme: Int
    let signature: String
    let timeStartedRecording: Double
    let timeStoppedRecording: Double
    let title: String
    let uniqueIdentifier: String
    
    init(_ details: [String: Any]) {
        auxiliaryLogUniqueIdentifier = plistValue("auxiliaryLogUniqueIdentifier", from: details, defaultValue: "")
        auxiliaryObservable = plistValue("auxiliaryObservable", from: details, defaultValue: [:])
        className = plistValue("className", from: details, defaultValue: "")
        documentTypeString = plistValue("documentTypeString", from: details, defaultValue: "")
        domainType = plistValue("domainType", from: details, defaultValue: "")
        fileName = plistValue("fileName", from: details, defaultValue: "")
        hasAuxiliaryLog = plistValue("hasAuxiliaryLog", from: details, defaultValue: false)
        hasCoverageData = plistValue("hasCoverageData", from: details, defaultValue: false)
        hasPrimaryLog = plistValue("hasPrimaryLog", from: details, defaultValue: false)
        primaryObservable = plistValue("primaryObservable", from: details, defaultValue: [:])
        schemeIdentifierContainerName = plistValue("schemeIdentifierContainerName", from: details, defaultValue: "")
        schemeIdentifierSchemeName = plistValue("schemeIdentifierSchemeName", from: details, defaultValue: "")
        schemeIdentifierSharedScheme = plistValue("schemeIdentifierSharedScheme", from: details, defaultValue: 0)
        signature = plistValue("signature", from: details, defaultValue: "")
        timeStartedRecording = plistValue("timeStartedRecording", from: details, defaultValue: 0.0)
        timeStoppedRecording = plistValue("timeStoppedRecording", from: details, defaultValue: 0.0)
        title = plistValue("title", from: details, defaultValue: "")
        uniqueIdentifier = plistValue("uniqueIdentifier", from: details, defaultValue: "")
    }
}

private func plistValue<T>(_ key: String, from details: [String: Any], defaultValue: T) -> T {
    if let value = details[key] as? T {
        return value
    } else {
        return defaultValue
    }
}
