//
//  TestValue.swift
//
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

//- TestValue
//  * Kind: object
//  * Properties:
//	+ description: String
//	+ debugDescription: String?
//	+ typeName: String?
//	+ fullyQualifiedTypeName: String?
//	+ label: String?
//	+ isCollection: Bool
//	+ children: TestValue?
public class TestValue: XCResultObject {
	public let description: String
	public let debugDescription: String?
	public let typeName: String?
	public let fullyQualifiedTypeName: String?
	public let label: String?
	public let isCollection: Bool
	public let children: TestValue?
	
	required public init?(_ json: [String: AnyObject]) {
		
		do {
			description = try xcRequired(element: "description", from: json)
			debugDescription = xcOptional(element: "debugDescription", from: json)
			typeName = xcOptional(element: "typeName", from: json)
			fullyQualifiedTypeName = xcOptional(element: "fullyQualifiedTypeName", from: json)
			label = xcOptional(element: "label", from: json)
			isCollection = try xcRequired(element: "isCollection", from: json)
			children = xcOptional(element: "children", from: json)
		} catch {
			logError("Error parsing TestValue: \(error.localizedDescription)")
			return nil
		}
	}
}
