//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActivityLogAnalyzerStep
//  * Kind: object
//  * Properties:
//    + parentIndex: Int

public struct ActivityLogAnalyzerStep: XCResultObject {
    public let parentIndex: Int

    public init?(_ json: [String: AnyObject]) {
        do {
            parentIndex = try xcRequired(element: "parentIndex", from: json)
        } catch {
            logError("Error parsing ActivityLogAnalyzerStep: \(error.localizedDescription)")
            return nil
        }
    }
}
