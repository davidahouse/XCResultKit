//
//  ActivityLogAnalyzerControlFlowStepEdge.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogAnalyzerControlFlowStepEdge
//  * Kind: object
//  * Properties:
//    + startLocation: DocumentLocation?
//    + endLocation: DocumentLocation?

public struct ActivityLogAnalyzerControlFlowStepEdge: XCResultObject {
    public let startLocation: DocumentLocation?
    public let endLocation: DocumentLocation?

    public init?(_ json: [String: AnyObject]) {
        startLocation = xcOptional(element: "startLocation", from: json)
        endLocation = xcOptional(element: "endLocation", from: json)
    }
}
