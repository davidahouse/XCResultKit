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

struct IssueSummary {
    let issueType: String
    let message: String
    let producingTarget: String?
    let documentLocationinCreatingWorkspace: DocumentLocation?
}
