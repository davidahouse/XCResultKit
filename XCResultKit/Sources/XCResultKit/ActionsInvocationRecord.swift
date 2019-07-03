//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//  Version: 3.19
//
//   - ActionsInvocationRecord
//      * Kind: object
//      * Properties:
//      + metadataRef: Reference?
//      + metrics: ResultMetrics
//      + issues: ResultIssueSummaries
//      + actions: [ActionRecord]
//      + archive: ArchiveInfo?

import Foundation

struct ActionsInvocationRecord: XCResultObject {
    let metadataRef: Reference?
    let metrics: ResultMetrics
    let issues: ResultIssueSummaries
    let actions: [ActionRecord]
    let archive: ArchiveInfo?
    
    init?(_ json: [String: AnyObject]) {
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "ActionsInvocationRecord" else {
            print("Incorrect type, expecting ActionsInvocationRecord")
            return nil
        }
        
        // Also ensure we have our required top level data
        guard let jsonMetrics = json["metrics"] as? [String: AnyObject], let actualMetrics = ResultMetrics(jsonMetrics) else {
            print("metrics key not found")
            return nil
        }
        metrics = actualMetrics
        
        guard let jsonIssues = json["issues"] as? [String: AnyObject], let actualIssues = ResultIssueSummaries(jsonIssues) else {
            print("issues key not found")
            return nil
        }
        issues = actualIssues
        
        if let jsonActions = json["actions"] as? [String: AnyObject], let actualActionsArray = jsonActions["_values"] as? [[String: AnyObject]] {
            actions = actualActionsArray.compactMap { ActionRecord($0) }
        } else {
            actions = []
        }
        
        if let jsonMetadataRef = json["metadataRef"] as? [String: AnyObject] {
            metadataRef = Reference(jsonMetadataRef)
        } else {
            metadataRef = nil
        }
        
        archive = parse(element: "archive", from: json)
    }
}
