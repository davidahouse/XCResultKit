//
//  TestIssueSummary.swift
//  XCResultKit
//
//  Created by Tyler Vick on 7/10/23.
//
// - TestIssueSummary
// * Supertype: IssueSummary
// * Kind: object
// * Properties:
//     + testCaseName: String

import Foundation

public struct TestIssueSummary: XCResultObject {

    public let testCaseName: String

    public init?(_ json: [String: AnyObject]) {
        do {
            testCaseName = try xcRequired(element: "testCaseName", from: json)
        } catch {
            return nil
        }
    }
}
