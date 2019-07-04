import XCTest
@testable import XCResultKit

final class ActionTestPlanRunSummariesTests: XCTestCase {
    
    func testCanParseCorrectlyFormattedJSON() {
        
        let record = ActionTestPlanRunSummaries(parse(validActionTestPlanRunSummaries))
        XCTAssertNotNil(record)
        XCTAssertGreaterThan(record?.summaries.count ?? 0, 0)
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
    
    private let validActionTestPlanRunSummaries = """
{
    "_type" : {
        "_name" : "ActionTestPlanRunSummaries"
    },
    "summaries" : {
        "_type" : {
            "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestPlanRunSummary",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Test Scheme Action"
        },
        "testableSummaries" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestableSummary",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        },
        "diagnosticsDirectoryName" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests-BB1C2E60-FC41-4EE1-9106-4BE6EC6CE274"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests"
        },
        "projectRelativePath" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacade.xcodeproj"
        },
        "targetName" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests"
        },
        "testKind" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "app hosted"
        },
        "tests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestSummaryGroup",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.38706398010253906"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "All tests"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "All tests"
        },
        "subtests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestSummaryGroup",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.38596904277801514"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests.xctest"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests.xctest"
        },
        "subtests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestSummaryGroup",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.28677403926849365"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests"
        },
        "subtests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestMetadata",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.0008440017700195312"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests/testExample()"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "testExample()"
        },
        "testStatus" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Success"
        }
        },
        {
        "_type" : {
        "_name" : "ActionTestMetadata",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.2849080562591553"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "BlueFacadeTests/testPerformanceExample()"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "testPerformanceExample()"
        },
        "summaryRef" : {
        "_type" : {
        "_name" : "Reference"
        },
        "id" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "0~NeHIr_4bEGGshR4YM6qNKuo8-gsj__3O26rJR5Y9vBiC3AveLBRO0AekgETrcYWPbeqZUe7isZ6LOLxyYETiTQ=="
        },
        "targetType" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionTestSummary"
        },
        "supertype" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionTestSummaryIdentifiableObject"
        },
        "supertype" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionAbstractTestSummary"
        }
        }
        }
        }
        },
        "testStatus" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Success"
        }
        }
        ]
        }
        },
        {
        "_type" : {
        "_name" : "ActionTestSummaryGroup",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.0009959936141967773"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "DataCacheTests"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "DataCacheTests"
        },
        "subtests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestMetadata",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.0006099939346313477"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "DataCacheTests/testCacheReturnsDefaultValueWhenKeyNotInCache()"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "testCacheReturnsDefaultValueWhenKeyNotInCache()"
        },
        "testStatus" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Success"
        }
        }
        ]
        }
        },
        {
        "_type" : {
        "_name" : "ActionTestSummaryGroup",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.09706997871398926"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "WidgetHorizontalLEDGaugeTests"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "WidgetHorizontalLEDGaugeTests"
        },
        "subtests" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestMetadata",
        "_supertype" : {
        "_name" : "ActionTestSummaryIdentifiableObject",
        "_supertype" : {
        "_name" : "ActionAbstractTestSummary"
        }
        }
        },
        "duration" : {
        "_type" : {
        "_name" : "Double"
        },
        "_value" : "0.09664797782897949"
        },
        "identifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "WidgetHorizontalLEDGaugeTests/testCapture()"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "testCapture()"
        },
        "summaryRef" : {
        "_type" : {
        "_name" : "Reference"
        },
        "id" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "0~TPsL4Qr5m4ZJHCTB-T9SPFD1qzyWJFjR9H7nFUyfemWzcbMxnkBg4mBDjRDhhGM8x0SmTsmNCjv4CSGYIu47Mg=="
        },
        "targetType" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionTestSummary"
        },
        "supertype" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionTestSummaryIdentifiableObject"
        },
        "supertype" : {
        "_type" : {
        "_name" : "TypeDefinition"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ActionAbstractTestSummary"
        }
        }
        }
        }
        },
        "testStatus" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Success"
        }
        }
        ]
        }
        }
        ]
        }
        }
        ]
        }
        }
        ]
        }
        }
        ]
        }
        }
        ]
    }
}
"""
}
