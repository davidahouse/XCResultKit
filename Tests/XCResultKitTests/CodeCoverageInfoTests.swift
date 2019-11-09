//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

import XCTest
@testable import XCResultKit

final class CodeCoverageTests: XCTestCase {
    
    func testCanParseCorrectlyFormattedJSON() {
        
        let parsed = CodeCoverageInfo(parse(codeCoverageInfoJson))
        XCTAssertNotNil(parsed)
        
        guard let hasCoverageData = parsed?.hasCoverageData else {
            XCTFail("HasCoverageData should have been parseable")
            return
        }
        XCTAssertTrue(hasCoverageData)
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
    
    let codeCoverageInfoJson = """
    {
        "_type" : {
            "_name" : "CodeCoverageInfo"
        },
        "archiveRef" : {
            "_type" : {
                "_name" : "Reference"
            },
            "id" : {
                "_type" : {
                    "_name" : "String"
                },
                "_value" : "0~_5UojoWVQ__T7UKX3P0LUDCl6Sa2vRrRJ77EaCb6W-ydtep5ytegiAYP0L47zEkT6S48q5l7KTjumZPhuVkX2A=="
            }
        },
        "hasCoverageData" : {
            "_type" : {
                "_name" : "Bool"
            },
            "_value" : "true"
        },
        "reportRef" : {
            "_type" : {
                "_name" : "Reference"
            },
            "id" : {
                "_type" : {
                    "_name" : "String"
                },
                "_value" : "0~tMbSgi2-HDwTlHgtVCQzY2ZeC6xaIPpBNZYeM6qiyIK07epF7rS6w5hkE6FhlssHoHxKqBmo3rTIG2qi5qKaLg=="
            }
        }
    }
    """
}
