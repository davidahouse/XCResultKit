//
//  TestArgument.swift
//
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

//- TestArgument
//  * Kind: object
//  * Properties:
//	+ parameter: TestParameter?
//	+ identifier: String?
//	+ description: String
//	+ debugDescription: String?
//	+ typeName: String?
//	+ value: TestValue
public struct TestArgument: XCResultObject {
	public let parameter: TestParameter?
	public let identifier: String?
	public let description: String
	public let debugDescription: String?
	public let typeName: String?
	public let value: TestValue

	public init?(_ json: [String: AnyObject]) {
		do {
			parameter = xcOptional(element: "parameter", from: json)
			identifier = xcOptional(element: "identifier", from: json)
			description = try xcRequired(element: "description", from: json)
			debugDescription = xcOptional(element: "debugDescription", from: json)
			typeName = xcOptional(element: "typeName", from: json)
			value = try xcRequired(element: "value", from: json)
		} catch {
			logError("Error parsing TestArgument: \(error.localizedDescription)")
			return nil
		}
	}
}

