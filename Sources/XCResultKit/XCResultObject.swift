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

enum XCResultError: Error {
    case elementNotFound(String)
}

extension XCResultError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case let .elementNotFound(element):
            return "Element Not Found: \(element)"
        }
    }
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

func xcArray(element: String, from json: [String: AnyObject]) -> [[String: AnyObject]] {
    if let jsonElement = json[element] as? [String: AnyObject], let array = jsonElement["_values"] as? [[String: AnyObject]] {
        return array
    } else {
        return []
    }
}
