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

struct ActionsInvocationRecord {
    let metadataRef: Reference?
    let metrics: ResultMetrics
    let issues: ResultIssueSummaries
    let actions: [ActionRecord]
    let archive: ArchiveInfo?
}
