//
//  TestParameter.swift
//
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

//- TestParameter
//  * Kind: object
//  * Properties:
//	+ label: String
//	+ name: String?
//	+ typeName: String?
//	+ fullyQualifiedTypeName: String?
public struct TestParameter: XCResultObject {
	public let label: String
	public let name: String?
	
	public let typeName: String?
	public let fullyQualifiedTypeName: String?


	public init?(_ json: [String: AnyObject]) {
		do {
			label = try xcRequired(element: "label", from: json)
			name = xcOptional(element: "name", from: json)
			typeName = xcOptional(element: "typeName", from: json)
			fullyQualifiedTypeName = xcOptional(element: "fullyQualifiedTypeName", from: json)
		} catch {
			logError("Error parsing TestParameter: \(error.localizedDescription)")
			return nil
		}
	}
}
