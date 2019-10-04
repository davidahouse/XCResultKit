//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- TestFailureIssueSummary
//    * Supertype: IssueSummary
//* Kind: object
//* Properties:
//+ testCaseName: String

import Foundation

public struct TestFailureIssueSummary: XCResultObject {
    public let testCaseName: String
    public let issueType: String
    public let message: String
    public let producingTarget: String?
    public let documentLocationInCreatingWorkspace: DocumentLocation?
    
    public init?(_ json: [String : AnyObject]) {
        do {
            testCaseName = try xcRequired(element: "testCaseName", from: json)
            issueType = try xcRequired(element: "issueType", from: json)
            message = try xcRequired(element: "message", from: json)
            producingTarget = xcOptional(element: "producingTarget", from: json)
            documentLocationInCreatingWorkspace = xcOptional(element: "documentLocationInCreatingWorkspace", from: json)
        } catch {
            debug("Error parsing TestFailureIssueSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
