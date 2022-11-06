//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActionTestExpectedFailure
//  * Kind: object
//  * Properties:
//    + uuid: String
//    + failureReason: String?
//    + failureSummary: ActionTestFailureSummary?
//    + isTopLevelFailure: Bool

public struct ActionTestExpectedFailure: XCResultObject {
 
    public let uuid: String?
    public let failureReason: String?
    public let failureSummary: ActionTestFailureSummary?
    public let isTopLevelFailure: Bool

    public init(_ json: [String: AnyObject]) {
        uuid = xcOptional(element: "uuid", from: json)
        failureReason = xcOptional(element: "failureReason", from: json)
        failureSummary = xcOptional(element: "failureSummary", from: json)
        isTopLevelFailure = xcOptional(element: "isTopLevelFailure", from: json) ?? false
    }
}
