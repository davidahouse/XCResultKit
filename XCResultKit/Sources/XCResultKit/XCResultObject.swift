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
