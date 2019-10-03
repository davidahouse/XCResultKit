//
//  ActivityLogMessageAnnotation.swift
//  XCResultKit
//
//  Created by Pierre Felgines on 03/10/2019.
//

import Foundation

//- ActivityLogMessageAnnotation
//  * Kind: object
//  * Properties:
//    + title: String
//    + location: DocumentLocation?

public struct ActivityLogMessageAnnotation: XCResultObject {
    public let title: String
    public let location: DocumentLocation?

    public init?(_ json: [String : AnyObject]) {
        do {
            title = try xcRequired(element: "title", from: json)
            location = xcOptional(element: "location", from: json)
        } catch {
            debug("Error parsing ActivityLogMessageAnnotation: \(error.localizedDescription)")
            return nil
        }
    }
}
