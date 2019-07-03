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

struct IssueSummary: XCResultObject {
    let issueType: XCResultString?
    let message: XCResultString?
    let producingTarget: XCResultString?
    let documentLocationInCreatingWorkspace: DocumentLocation?
    
    init?(_ json: [String: AnyObject]) {
        
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
