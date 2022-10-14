//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SourceCodeFrame
//   * Kind: object
//   * Properties:
//     + addressString: String?
//     + symbolInfo: SourceCodeSymbolInfo?

public struct SourceCodeFrame: XCResultObject {
    public let addressString: String?
    public let symbolInfo: SourceCodeSymbolInfo?
    
    public init?(_ json: [String: AnyObject]) {
        addressString = xcOptional(element: "addressString", from: json)
        symbolInfo = xcOptional(element: "symbolInfo", from: json)
    }
}
