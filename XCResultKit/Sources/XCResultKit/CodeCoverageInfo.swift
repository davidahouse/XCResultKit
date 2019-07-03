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

struct CodeCoverageInfo: XCResultObject {
    let hasCoverageData: XCResultBool?
    let reportRef: Reference?
    let archiveRef: Reference?
    
    init?(_ json: [String: AnyObject]) {
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "CodeCoverageInfo" else {
            print("Incorrect type, expecting CodeCoverageInfo")
            return nil
        }
        
        hasCoverageData = parse(element: "hasCoverageData", from: json)
        reportRef = parse(element: "reportRef", from: json)
        archiveRef = parse(element: "archiveRef", from: json)
    }
}
