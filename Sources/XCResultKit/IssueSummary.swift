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
    public let issueType: XCResultString?
    public let message: XCResultString?
    public let producingTarget: XCResultString?
    public let documentLocationInCreatingWorkspace: DocumentLocation?
    
    public init?(_ json: [String: AnyObject]) {
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "IssueSummary" else {
            print("Incorrect type, expecting IssueSummary")
            return nil
        }
        
        issueType = parse(element: "issueType", from: json)
        message = parse(element: "message", from: json)
        producingTarget = parse(element: "producingTarget", from: json)
        documentLocationInCreatingWorkspace = parse(element: "documentLocationInCreatingWorkspace", from: json)
    }
}
