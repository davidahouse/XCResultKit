//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ActionRecord
//    * Kind: object
//* Properties:
//+ schemeCommandName: String
//+ schemeTaskName: String
//+ title: String?
//+ startedTime: Date
//+ endedTime: Date
//+ runDestination: ActionRunDestinationRecord
//+ buildResult: ActionResult
//+ actionResult: ActionResult

import Foundation

struct ActionRecord: XCResultObject {
    let schemeCommandName: XCResultString?
    let schemeTaskName: XCResultString?
    let title: XCResultString?
    let startedTime: XCResultDate?
    let endedTime: XCResultDate?
    let runDestination: ActionRunDestinationRecord?
    let buildResult: ActionResult?
    let actionResult: ActionResult?
    
    init?(_ json: [String: AnyObject]) {
        
        // Ensure we have the correct type here
        guard let type = json["_type"] as? [String: AnyObject], let name = type["_name"] as? String, name == "ActionRecord" else {
            print("Incorrect type, expecting ActionRecord")
            return nil
        }
        
        schemeCommandName = parse(element: "schemeCommandName", from: json)
        schemeTaskName = parse(element: "schemeTaskName", from: json)
        buildResult = parse(element: "buildResult", from: json)
        actionResult = parse(element: "actionResult", from: json)
        title = parse(element: "title", from: json)
        startedTime = parse(element: "startedTime", from: json)
        endedTime = parse(element: "endedTime", from: json)
        runDestination = parse(element: "runDestination", from: json)
    }
}
