//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

protocol XCResultObject {
    init?(_ json: [String: AnyObject])
}

func parse<T: XCResultObject>(element: String, from json: [String: AnyObject]) -> T? {
    if let elementJson = json[element] as? [String: AnyObject] {
        return T(elementJson)
    } else {
        return nil
    }
}

enum XCResultError: Error {
    case elementNotFound(String)
}

func xcRequired<T: XCResultObject>(element: String, from json: [String: AnyObject]) throws -> T {
    if let elementJson = json[element] as? [String: AnyObject], let element = T(elementJson) {
        return element
    } else {
        throw XCResultError.elementNotFound(element)
    }
}

func xcOptional<T: XCResultObject>(element: String, from json: [String: AnyObject]) -> T? {
    if let elementJson = json[element] as? [String: AnyObject] {
        return T(elementJson)
    } else {
        return nil
    }
}
