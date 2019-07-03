//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

import XCTest
@testable import XCResultKit

final class XCResultBoolTests: XCTestCase {
    
    func testCanParseCorrectlyFormattedJSON() {
        
        let parsed = XCResultBool(parse(boolJson))
        guard let parsedObject = parsed else {
            XCTFail("Unable to parse XCResultBool object")
            return
        }
        XCTAssertTrue(parsedObject.value)
    }
    
    static var allTests = [
        ("testCanParseCorrectlyFormattedJSON", testCanParseCorrectlyFormattedJSON),
    ]
    
    private func parse(_ jsonData: String) -> [String: AnyObject] {
        
        do {
            guard let data = jsonData.data(using: .utf8) else {
                fatalError("Unable to turn string into data, must not be a utf8 string")
            }
            
            guard let rootJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] else {
                fatalError("Expecting top level dictionary but didn't find one")
            }
            return rootJSON
        } catch {
            fatalError("Error deserializing JSON: \(error)")
        }
    }
    
    let boolJson = """
    {
        "_type" : {
            "_name" : "Bool"
        },
        "_value" : "true"
    }
    """
}
