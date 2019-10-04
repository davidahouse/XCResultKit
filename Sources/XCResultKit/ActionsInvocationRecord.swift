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

public struct ActionsInvocationRecord: XCResultObject {
    public let metadataRef: Reference?
    public let metrics: ResultMetrics
    public let issues: ResultIssueSummaries
    public let actions: [ActionRecord]
    public let archive: ArchiveInfo?
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            metrics = try xcRequired(element: "metrics", from: json)
            issues = try xcRequired(element: "issues", from: json)
            metadataRef = xcOptional(element: "metadataRef", from: json)
            archive = xcOptional(element: "archive", from: json)
            actions = xcArray(element: "actions", from: json).compactMap { ActionRecord($0) }
        } catch {
            debug("Error parsing ActionsInvocationRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
