//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SourceCodeLocation
//   * Kind: object
//   * Properties:
//     + filePath: String?
//     + lineNumber: Int?

public struct SourceCodeLocation: XCResultObject {
    public let filePath: String?
    public let lineNumber: Int?
    
    public init?(_ json: [String: AnyObject]) {
        filePath = xcOptional(element: "filePath", from: json)
        lineNumber = xcOptional(element: "lineNumber", from: json)
    }
}
