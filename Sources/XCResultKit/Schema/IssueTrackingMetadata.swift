//
//  IssueTrackingMetadata.swift
//  
//
//  Created by Blechman, Ben on 6/24/24.
//

import Foundation

// - IssueTrackingMetadata
//   * Kind: object
//   * Properties:
//	 + identifier: String
//	 + url: URL?
//	 + comment: String?
//	 + summary: String
public struct IssueTrackingMetadata: XCResultObject {
	public let identifier: String
	public let url: String?
	public let comment: String?
	public let summary: String
	
	public init?(_ json: [String: AnyObject]) {
		
		do {
			identifier = try xcRequired(element: "identifier", from: json)
			url = xcOptional(element: "url", from: json)
			comment = xcOptional(element: "comment", from: json)
			summary = try xcRequired(element: "summary", from: json)
		} catch {
			logError("Error parsing IssueTrackingMetadata: \(error.localizedDescription)")
			return nil
		}
	}
}
