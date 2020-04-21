//
//  File.swift
//  
//
//  Created by David House on 7/2/19.
//

import Foundation

import XCTest
@testable import XCResultKit

final class ResultMetricsTests: XCTestCase {
    
    func testCanParseCorrectlyFormattedJSON() throws {
        let parsed = try XCTUnwrap(ResultMetrics(parse(resultMetricsJson)))
        XCTAssertEqual(parsed.testsCount, 1)
        XCTAssertEqual(parsed.testsFailedCount, nil)
        XCTAssertEqual(parsed.testsSkippedCount, nil)
    }

    func testCanParseCorrectlyFormattedJSON2() throws {
        let parsed = try XCTUnwrap(ResultMetrics(parse(resultMetricsJson2)))
        XCTAssertEqual(parsed.testsCount, 10)
        XCTAssertEqual(parsed.testsFailedCount, 4)
        XCTAssertEqual(parsed.testsSkippedCount, 1)
    }
    
    static var allTests = [
        ("testCanParseCorrectlyFormattedJSON", testCanParseCorrectlyFormattedJSON),
        ("testCanParseCorrectlyFormattedJSON2", testCanParseCorrectlyFormattedJSON2),
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
    
    let resultMetricsJson = """
    {
        "_type" : {
            "_name" : "ResultMetrics"
        },
        "testsCount" : {
            "_type" : {
                "_name" : "Int"
            },
            "_value" : "1"
        }
    }
    """

    let resultMetricsJson2 = """
    {
        "_type" : {
            "_name" : "ResultMetrics"
        },
        "testsCount" : {
            "_type" : {
                "_name" : "Int"
            },
            "_value" : "10"
        },
        "testsFailedCount" : {
            "_type" : {
                "_name" : "Int"
            },
            "_value" : "4"
        },
        "testsSkippedCount" : {
            "_type" : {
                "_name" : "Int"
            },
            "_value" : "1"
        }
    }
    """
}
