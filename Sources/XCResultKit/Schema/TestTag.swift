//
//  TestTag.swift
//
//
//  Created by Blechman, Ben on 6/20/24.
//
//- TestTag
//  * Kind: object
//  * Properties:
//	+ identifier: String
//	+ name: String
//	+ anchors: [String]

import Foundation

public struct TestTag: XCResultObject {
	public let identifier: String?
	public let name: String
	public let anchors: String?
	
	public init?(_ json: [String: AnyObject]) {
		do {
			identifier = xcOptional(element: "identifier", from: json)
			name = try xcRequired(element: "name", from: json)
			anchors = xcOptional(element: "anchors", from: json)
		} catch {
			logError("Error parsing TestTag: \(error.localizedDescription)")
			return nil
		}
	}
}
