import XCTest
@testable import XCResultKit

final class ActionTestSummaryTests: XCTestCase {

    func testCanParseCorrectlyFormattedJSON() {

        let record = ActionTestSummary(parse(validActionTestSummary))
        XCTAssertNotNil(record)
        XCTAssertGreaterThan(record!.activitySummaries.count, 0)
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

    // test data
    private let validActionTestSummary = """
{
    "_type" : {
        "_name" : "ActionTestSummary",
        "_supertype" : {
            "_name" : "ActionTestSummaryIdentifiableObject",
            "_supertype" : {
                "_name" : "ActionAbstractTestSummary"
            }
        }
    },
    "activitySummaries" : {
        "_type" : {
            "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestActivitySummary"
        },
        "activityType" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "com.apple.dt.xctest.activity-type.attachmentContainer"
        },
        "attachments" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestAttachment"
        },
        "filename" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ViewControllerWithTwoDetails_1_6797ED56-5335-4E26-B1E4-95777E1AAB28.png"
        },
        "inActivityIdentifier" : {
        "_type" : {
        "_name" : "Int"
        },
        "_value" : "1"
        },
        "lifetime" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "keepAlways"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ViewControllerWithTwoDetails"
        },
        "payloadRef" : {
        "_type" : {
        "_name" : "Reference"
        },
        "id" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "0~j4gZ6UZzbaWO3v9w7LhCEjud7KE3XOAuf1POvoeeq6lrqDWq8tfVUqtMWLLgXsYXq13_Ntazj8-Eu50MtZCc6g=="
        }
        },
        "payloadSize" : {
        "_type" : {
        "_name" : "Int"
        },
        "_value" : "34674"
        },
        "timestamp" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.236-0400"
        },
        "uniformTypeIdentifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "public.png"
        },
        "userInfo" : {
        "_type" : {
        "_name" : "SortedKeyValueArray"
        },
        "storage" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "SortedKeyValueArrayPair"
        },
        "key" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Scale"
        },
        "value" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "2"
        }
        }
        ]
        }
        }
        }
        ]
        },
        "finish" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.280-0400"
        },
        "start" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.280-0400"
        },
        "title" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Added attachment named 'ViewControllerWithTwoDetails'"
        },
        "uuid" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "6797ED56-5335-4E26-B1E4-95777E1AAB28"
        }
        },
        {
        "_type" : {
        "_name" : "ActionTestActivitySummary"
        },
        "activityType" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "com.apple.dt.xctest.activity-type.attachmentContainer"
        },
        "attachments" : {
        "_type" : {
        "_name" : "Array"
        },
        "_values" : [
        {
        "_type" : {
        "_name" : "ActionTestAttachment"
        },
        "filename" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ViewControllerWithTwoDetails_1_DCE48238-089B-43AC-899E-59DB673AAD4F"
        },
        "inActivityIdentifier" : {
        "_type" : {
        "_name" : "Int"
        },
        "_value" : "1"
        },
        "lifetime" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "keepAlways"
        },
        "name" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "ViewControllerWithTwoDetails"
        },
        "payloadRef" : {
        "_type" : {
        "_name" : "Reference"
        },
        "id" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "0~jUYPb3yllhPUKiG_rJo0PjLuP3q-5JL5ai8rmkGQtnZoqTejmL4uCu3ycKFBCFE_qpMHLkTaJqvgBL2_ZZjYTw=="
        }
        },
        "payloadSize" : {
        "_type" : {
        "_name" : "Int"
        },
        "_value" : "867"
        },
        "timestamp" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.281-0400"
        },
        "uniformTypeIdentifier" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "chute.styleSheet"
        }
        }
        ]
        },
        "finish" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.281-0400"
        },
        "start" : {
        "_type" : {
        "_name" : "Date"
        },
        "_value" : "2019-07-04T10:58:06.281-0400"
        },
        "title" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "Added attachment named 'ViewControllerWithTwoDetails'"
        },
        "uuid" : {
        "_type" : {
        "_name" : "String"
        },
        "_value" : "DCE48238-089B-43AC-899E-59DB673AAD4F"
        }
        }
        ]
    },
    "duration" : {
        "_type" : {
            "_name" : "Double"
        },
        "_value" : "0.07259905338287354"
    },
    "identifier" : {
        "_type" : {
            "_name" : "String"
        },
        "_value" : "ViewControllerTests/testViewControllerWithTwoDetails()"
    },
    "name" : {
        "_type" : {
            "_name" : "String"
        },
        "_value" : "testViewControllerWithTwoDetails()"
    },
    "testStatus" : {
        "_type" : {
            "_name" : "String"
        },
        "_value" : "Success"
    }
}
"""
}
