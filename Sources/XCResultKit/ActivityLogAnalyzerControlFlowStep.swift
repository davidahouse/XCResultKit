//
//  ActivityLogAnalyzerControlFlowStep.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation

//- ActivityLogAnalyzerStep
//  * Kind: object
//  * Properties:
//    + parentIndex: Int
//
//      - ActivityLogAnalyzerControlFlowStep
//        * Supertype: ActivityLogAnalyzerStep
//        * Kind: object
//        * Properties:
//          + title: String
//          + startLocation: DocumentLocation?
//          + endLocation: DocumentLocation?
//          + edges: [ActivityLogAnalyzerControlFlowStepEdge]

public struct ActivityLogAnalyzerControlFlowStep: XCResultObject {
    public let parentIndex: Int
    public let title: String
    public let startLocation: DocumentLocation?
    public let endLocation: DocumentLocation?
    public let edges: [ActivityLogAnalyzerControlFlowStepEdge]

    public init?(_ json: [String : AnyObject]) {
        do {
            parentIndex = try xcRequired(element: "parentIndex", from: json)
            title = try xcRequired(element: "title", from: json)
            startLocation = xcOptional(element: "startLocation", from: json)
            endLocation = xcOptional(element: "endLocation", from: json)
            edges = xcArray(element: "edges", from: json)
                .ofType(ActivityLogAnalyzerControlFlowStepEdge.self)
        } catch {
            debug("Error parsing ActivityLogAnalyzerControlFlowStep: \(error.localizedDescription)")
            return nil
        }
    }
}
