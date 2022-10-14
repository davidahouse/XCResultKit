//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SourceCodeSymbolInfo
//  * Kind: object
//  * Properties:
//    + imageName: String?
//    + symbolName: String?
//    + location: SourceCodeLocation?

public struct SourceCodeSymbolInfo: XCResultObject {
    public let imageName: String?
    public let symbolName: String?
    public let location: SourceCodeLocation?
    
    public init?(_ json: [String: AnyObject]) {
        imageName = xcOptional(element: "imageName", from: json)
        symbolName = xcOptional(element: "symbolName", from: json)
        location = xcOptional(element: "location", from: json)
    }
}
