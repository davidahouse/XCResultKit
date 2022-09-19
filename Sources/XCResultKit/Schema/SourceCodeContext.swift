//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- SourceCodeContext
//  * Kind: object
//  * Properties:
//    + location: SourceCodeLocation?
//    + callStack: [SourceCodeFrame]

public struct SourceCodeContext: XCResultObject {
    public let location: SourceCodeLocation?
    public let callStack: [SourceCodeFrame]
    
    public init?(_ json: [String: AnyObject]) {
        location = xcOptional(element: "location", from: json)
        callStack = xcArray(element: "callStack", from: json).ofType(SourceCodeFrame.self)
    }
}
