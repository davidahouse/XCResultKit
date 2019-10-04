//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- IssueSummary
//    * Kind: object
//* Properties:
//+ issueType: String
//+ message: String
//+ producingTarget: String?
//+ documentLocationInCreatingWorkspace: DocumentLocation?

import Foundation

public struct IssueSummary: XCResultObject {
    public let issueType: String
    public let message: String
    public let producingTarget: String?
    public let documentLocationInCreatingWorkspace: DocumentLocation?
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            issueType = try xcRequired(element: "issueType", from: json)
            message = try xcRequired(element: "message", from: json)
            producingTarget = xcOptional(element: "producingTarget", from: json)
            documentLocationInCreatingWorkspace = xcOptional(element: "documentLocationInCreatingWorkspace", from: json)
        } catch {
            debug("Error parsing IssueSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
