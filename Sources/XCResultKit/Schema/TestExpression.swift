//
//  TestExpression.swift
//  
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

// Note that because this type uses nested recursion, it cannot be a struct, it must be a class
//- TestExpression
//  * Kind: object
//  * Properties:
//	+ sourceCode: String
//	+ value: TestValue?
//	+ subexpressions: [TestExpression]
public class TestExpression: XCResultObject {
	
	public let sourceCode: String
	public let value: TestValue?
	public let subexpressions: [TestExpression]
	
	required public init?(_ json: [String: AnyObject]) {
		
		do {
			sourceCode = try xcRequired(element: "sourceCode", from: json)
			value = xcOptional(element: "value", from: json)
			subexpressions = xcArray(element: "subexpressions", from: json)
				.ofType(TestExpression.self)
		} catch {
			logError("Error parsing TestExpression: \(error.localizedDescription)")
			return nil
		}
	}
}
