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

extension Array where Element == [String: AnyObject] {

    func ofType(_ type: String) -> [Element] {
        return filter { json -> Bool in
            guard let typeJson = json["_type"] as? [String: AnyObject] else { return false }
            guard let typeNameJson = typeJson["_name"] as? String else { return false }
            return type == typeNameJson
        }
    }

    func ofType<T>(_ type: T.Type) -> [T] where T: XCResultObject {
        return ofType(String(describing: type)).compactMap(T.init)
    }
}
