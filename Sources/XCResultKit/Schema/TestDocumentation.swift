//
//  TestDocumentation.swift
//  
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

//- TestDocumentation
//  * Kind: object
//  * Properties:
//	+ content: String
//	+ format: String
public struct TestDocumentation: XCResultObject {
	public let content: String
	public let format: String
	
	public init?(_ json: [String: AnyObject]) {
		
		do {
			content = try xcRequired(element: "content", from: json)
			format = try xcRequired(element: "format", from: json)
		} catch {
			logError("Error parsing TestDocumentation: \(error.localizedDescription)")
			return nil
		}
	}
}
