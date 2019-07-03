//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

import XCTest
@testable import XCResultKit

final class DocumentLocationTests: XCTestCase {
    
    func testCanParseCorrectlyFormattedJSON() {
        
        let parsed = DocumentLocation(parse(documentLocationJson))
        XCTAssertNotNil(parsed)
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
    
    let documentLocationJson = """
    {
    "_type" : {
    "_name" : "DocumentLocation"
    },
    "concreteTypeName" : {
    "_type" : {
    "_name" : "String"
    },
    "_value" : "DVTTextDocumentLocation"
    },
    "url" : {
    "_type" : {
    "_name" : "String"
    },
    "_value" : "file:///Users/davidahouse/Projects/junk/BlueFacadeNoCoordinators/BlueFacade/View/Widgets/LEDGauge/WidgetHorizontalLEDGauge.swift#CharacterRangeLen=0&CharacterRangeLoc=728&EndingColumnNumber=12&EndingLineNumber=30&LocationEncoding=1&StartingColumnNumber=12&StartingLineNumber=30"
    }
    }
    """
}



