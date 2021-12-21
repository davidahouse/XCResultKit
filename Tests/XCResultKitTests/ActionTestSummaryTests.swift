import XCTest
@testable import XCResultKit

final class ActionTestSummaryTests: XCTestCase {

    func testCanParseCorrectlyFormattedJSON() {

        let record = ActionTestSummary(parse(validActionTestSummary))
        XCTAssertNotNil(record)
        XCTAssertGreaterThan(record!.activitySummaries.count, 0)
    }
    
    func testCanParseRepetitionPolicy() throws {
        let ats = try XCTUnwrap(ActionTestSummary(parse(actionTestSummaryWithRepetitionSummary)))
        
        let repetitionPolicy = try XCTUnwrap(ats.repetitionPolicySummary)
        
        XCTAssertEqual(repetitionPolicy.repetitionMode, .runRetryOnFailure)
        XCTAssertEqual(repetitionPolicy.totalIterations, 2)
        XCTAssertEqual(repetitionPolicy.iteration, 1)
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
    
    let actionTestSummaryWithRepetitionSummary = """
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
          "_value" : "com.apple.dt.xctest.activity-type.internal"
        },
        "finish" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.712-0700"
        },
        "start" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.690-0700"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Start Test at 2021-12-21 13:29:05.690"
        },
        "uuid" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "7EFFB7B6-FE6C-4635-B47F-CCBDE6C940FF"
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
          "_value" : "com.apple.dt.xctest.activity-type.deletedAttachment"
        },
        "finish" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.690-0700"
        },
        "start" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.690-0700"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Some screenshots were deleted because testing is configured to remove automatic screenshots on success."
        },
        "uuid" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "5A2D2FBF-973F-4C54-937B-680CFF6B5B45"
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
          "_value" : "com.apple.dt.xctest.activity-type.internal"
        },
        "finish" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.714-0700"
        },
        "start" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.713-0700"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Set Up"
        },
        "uuid" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "5A63EA34-2CF4-47C3-8D73-78F69BCEB356"
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
          "_value" : "com.apple.dt.xctest.activity-type.userCreated"
        },
        "finish" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.716-0700"
        },
        "start" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.715-0700"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Retryable Activity"
        },
        "uuid" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "BE88AAD4-3613-4AE8-8AEE-85DD3D09B2AC"
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
          "_value" : "com.apple.dt.xctest.activity-type.internal"
        },
        "finish" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.717-0700"
        },
        "start" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2021-12-21T13:29:05.716-0700"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Tear Down"
        },
        "uuid" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "5170EA32-DEE9-40A8-A87E-634EB7967081"
        }
      }
    ]
  },
  "duration" : {
    "_type" : {
      "_name" : "Double"
    },
    "_value" : "0.041687965393066406"
  },
  "identifier" : {
    "_type" : {
      "_name" : "String"
    },
    "_value" : "RetryTests/testRetryOnFailure()"
  },
  "name" : {
    "_type" : {
      "_name" : "String"
    },
    "_value" : "testRetryOnFailure()"
  },
  "repetitionPolicySummary" : {
    "_type" : {
      "_name" : "ActionTestritionPolicySummary"
    },
    "iteration" : {
      "_type" : {
        "_name" : "Int"
      },
      "_value" : "1"
    },
    "repetitionMode" : {
      "_type" : {
        "_name" : "String"
      },
      "_value" : "RunRetryOnFailure"
    },
    "totalIterations" : {
      "_type" : {
        "_name" : "Int"
      },
      "_value" : "2"
    }
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
