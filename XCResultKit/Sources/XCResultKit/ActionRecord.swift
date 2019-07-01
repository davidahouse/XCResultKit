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

struct ActionRecord {
    let schemeCommandName: String
    let schemeTaskName: String
    let title: String?
    let startedTime: Date
    let endedTime: Date
    let runDestination: ActionRunDestinationRecord
    let buildResult: ActionResult
    let actionResult: ActionResult
}
