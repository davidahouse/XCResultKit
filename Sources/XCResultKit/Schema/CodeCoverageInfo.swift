//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- CodeCoverageInfo
//    * Kind: object
//* Properties:
//+ hasCoverageData: Bool
//+ reportRef: Reference?
//+ archiveRef: Reference?

import Foundation

public struct CodeCoverageInfo: XCResultObject {
    public let hasCoverageData: Bool?
    public let reportRef: Reference<GenericReferencedObject>?
    public let archiveRef: Reference<GenericReferencedObject>?
    
    public init?(_ json: [String: AnyObject]) {
        hasCoverageData = xcOptional(element: "hasCoverageData", from: json)
        reportRef = xcOptional(element: "reportRef", from: json)
        archiveRef = xcOptional(element: "archiveRef", from: json)
    }
}
