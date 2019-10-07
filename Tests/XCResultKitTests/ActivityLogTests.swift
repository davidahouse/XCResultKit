//
//  ActivityLogTests.swift
//  XCResultKitTests
//
//  Created by Pierre Felgines on 05/10/2019.
//

import Foundation
import XCTest
@testable import XCResultKit

final class ActivityLogTests: XCTestCase {

    func testCanParseCorrectlyFormattedJSON() {

        let parsed = ActivityLogSection(parse(documentLocationJson))
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
    "_name" : "ActivityLogSection"
  },
  "domainType" : {
    "_type" : {
      "_name" : "String"
    },
    "_value" : "com.apple.dt.unit.cocoaUnitTest"
  },
  "duration" : {
    "_type" : {
      "_name" : "Double"
    },
    "_value" : "153.5236370563507"
  },
  "result" : {
    "_type" : {
      "_name" : "String"
    },
    "_value" : "succeeded"
  },
  "startTime" : {
    "_type" : {
      "_name" : "Date"
    },
    "_value" : "2019-10-03T15:37:20.261+0200"
  },
  "subsections" : {
    "_type" : {
      "_name" : "Array"
    },
    "_values" : [
      {
        "_type" : {
          "_name" : "ActivityLogMajorSection",
          "_supertype" : {
            "_name" : "ActivityLogSection"
          }
        },
        "domainType" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "com.apple.dt.unit.cocoaUnitTest"
        },
        "duration" : {
          "_type" : {
            "_name" : "Double"
          },
          "_value" : "44.572818994522095"
        },
        "result" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "succeeded"
        },
        "startTime" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2019-10-03T15:38:05.069+0200"
        },
        "subsections" : {
          "_type" : {
            "_name" : "Array"
          },
          "_values" : [
            {
              "_type" : {
                "_name" : "ActivityLogUnitTestSection",
                "_supertype" : {
                  "_name" : "ActivityLogSection"
                }
              },
              "domainType" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "com.apple.dt.IDE.UnitTestLogSection.Worker"
              },
              "duration" : {
                "_type" : {
                  "_name" : "Double"
                },
                "_value" : "41.27573120594025"
              },
              "emittedOutput" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "2019-10-03 15:38:07.850910+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.851025+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:07.872796+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.880342+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.880475+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:07.910883+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] Running tests...\\nTest Suite 'All tests' started at 2019-10-03 15:38:08.069\\nTest Suite 'XCTestHTMLReportSampleAppUITests.xctest' started at 2019-10-03 15:38:08.070\\nTest Suite 'FirstSuite' started at 2019-10-03 15:38:08.071\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\nTest Suite 'FirstSuite' passed at 2019-10-03 15:38:25.923.\\n\\t Executed 3 tests, with 0 failures (0 unexpected) in 17.851 (17.853) seconds\\nTest Suite 'SecondSuite' started at 2019-10-03 15:38:25.924\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:31.686\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83161\\n    t =     3.79s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.27s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\nTest Suite 'SecondSuite' failed at 2019-10-03 15:38:37.445.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 11.520 (11.521) seconds\\nTest Suite 'ThirdSuite' started at 2019-10-03 15:38:37.446\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:37.447\\n    t =     0.03s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83206\\n    t =     3.92s             Setting up automation session\\n    t =     4.46s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.67s test Activity - Success\\n    t =     5.67s test Activity - Failure\\n    t =     5.67s     Assertion Failure: ThirdSuite.swift:29: XCTAssertTrue failed - Test failed\\n    t =     5.72s test Activity with sub-activities\\n    t =     5.72s     test sub Activity 0 - Failure\\n    t =     5.72s         Assertion Failure: ThirdSuite.swift:33: XCTAssertTrue failed - Test failed\\n    t =     5.72s     test sub Activity 1 - Success\\n    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\nTest Suite 'ThirdSuite' failed at 2019-10-03 15:38:49.353.\\n\\t Executed 2 tests, with 3 failures (0 unexpected) in 11.905 (11.907) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUITests.xctest' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.284) seconds\\nTest Suite 'All tests' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.286) seconds\\n"
              },
              "result" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "succeeded"
              },
              "runnablePath" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "/Users/felginep/Library/Developer/Xcode/DerivedData/XCTestHTMLReportSampleApp-fmywasfnsjxoiucjtawjnsntkdkc/Build/Products/Debug-iphonesimulator/XCTestHTMLReportSampleAppUITests-Runner.app"
              },
              "runnableUTI" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "com.apple.application-bundle"
              },
              "startTime" : {
                "_type" : {
                  "_name" : "Date"
                },
                "_value" : "2019-10-03T15:38:05.069+0200"
              },
              "subsections" : {
                "_type" : {
                  "_name" : "Array"
                },
                "_values" : [
                  {
                    "_type" : {
                      "_name" : "ActivityLogCommandInvocationSection",
                      "_supertype" : {
                        "_name" : "ActivityLogSection"
                      }
                    },
                    "commandDetails" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUITests-B950CF55-4E02-414D-94A6-FCEE83520D4A/XCTestHTMLReportSampleAppUITests-91E1F09B-FA43-431B-ACDF-0FF86B852B5F/Session-XCTestHTMLReportSampleAppUITests-2019-10-03_153729-HNIPgP.log"
                    },
                    "domainType" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                    },
                    "duration" : {
                      "_type" : {
                        "_name" : "Double"
                      },
                      "_value" : "7.796287536621094e-05"
                    },
                    "messages" : {
                      "_type" : {
                        "_name" : "Array"
                      },
                      "_values" : [
                        {
                          "_type" : {
                            "_name" : "ActivityLogMessage"
                          },
                          "location" : {
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
                              "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUITests-B950CF55-4E02-414D-94A6-FCEE83520D4A/XCTestHTMLReportSampleAppUITests-91E1F09B-FA43-431B-ACDF-0FF86B852B5F/Session-XCTestHTMLReportSampleAppUITests-2019-10-03_153729-HNIPgP.log#CharacterRangeLen=0"
                            }
                          },
                          "shortTitle" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUITests-B950CF55-4E02-414D-94A6-FCEE83520D4A/XCTestHTMLReportSampleAppUITests-91E1F09B-FA43-431B-ACDF-0FF86B852B5F/Session-XCTestHTMLReportSampleAppUITests-2019-10-03_153729-HNIPgP.log"
                          },
                          "title" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUITests-B950CF55-4E02-414D-94A6-FCEE83520D4A/XCTestHTMLReportSampleAppUITests-91E1F09B-FA43-431B-ACDF-0FF86B852B5F/Session-XCTestHTMLReportSampleAppUITests-2019-10-03_153729-HNIPgP.log"
                          },
                          "type" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "notice"
                          }
                        }
                      ]
                    },
                    "result" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "succeeded"
                    },
                    "startTime" : {
                      "_type" : {
                        "_name" : "Date"
                      },
                      "_value" : "2019-10-03T15:38:05.069+0200"
                    },
                    "title" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Writing diagnostic log for test session. Please attach this log to any test-related bug reports."
                    }
                  },
                  {
                    "_type" : {
                      "_name" : "ActivityLogUnitTestSection",
                      "_supertype" : {
                        "_name" : "ActivityLogSection"
                      }
                    },
                    "domainType" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                    },
                    "duration" : {
                      "_type" : {
                        "_name" : "Double"
                      },
                      "_value" : "41.27573120594025"
                    },
                    "emittedOutput" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "2019-10-03 15:38:07.850910+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.851025+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:07.872796+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.880342+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:07.880475+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:07.910883+0200 XCTestHTMLReportSampleAppUITests-Runner[83084:14614693] Running tests...\\nTest Suite 'All tests' started at 2019-10-03 15:38:08.069\\nTest Suite 'XCTestHTMLReportSampleAppUITests.xctest' started at 2019-10-03 15:38:08.070\\nTest Suite 'FirstSuite' started at 2019-10-03 15:38:08.071\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\nTest Suite 'FirstSuite' passed at 2019-10-03 15:38:25.923.\\n\\t Executed 3 tests, with 0 failures (0 unexpected) in 17.851 (17.853) seconds\\nTest Suite 'SecondSuite' started at 2019-10-03 15:38:25.924\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:31.686\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83161\\n    t =     3.79s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.27s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\nTest Suite 'SecondSuite' failed at 2019-10-03 15:38:37.445.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 11.520 (11.521) seconds\\nTest Suite 'ThirdSuite' started at 2019-10-03 15:38:37.446\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:37.447\\n    t =     0.03s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83206\\n    t =     3.92s             Setting up automation session\\n    t =     4.46s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.67s test Activity - Success\\n    t =     5.67s test Activity - Failure\\n    t =     5.67s     Assertion Failure: ThirdSuite.swift:29: XCTAssertTrue failed - Test failed\\n    t =     5.72s test Activity with sub-activities\\n    t =     5.72s     test sub Activity 0 - Failure\\n    t =     5.72s         Assertion Failure: ThirdSuite.swift:33: XCTAssertTrue failed - Test failed\\n    t =     5.72s     test sub Activity 1 - Success\\n    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\nTest Suite 'ThirdSuite' failed at 2019-10-03 15:38:49.353.\\n\\t Executed 2 tests, with 3 failures (0 unexpected) in 11.905 (11.907) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUITests.xctest' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.284) seconds\\nTest Suite 'All tests' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.286) seconds\\n"
                    },
                    "result" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "succeeded"
                    },
                    "startTime" : {
                      "_type" : {
                        "_name" : "Date"
                      },
                      "_value" : "2019-10-03T15:38:08.071+0200"
                    },
                    "subsections" : {
                      "_type" : {
                        "_name" : "Array"
                      },
                      "_values" : [
                        {
                          "_type" : {
                            "_name" : "ActivityLogUnitTestSection",
                            "_supertype" : {
                              "_name" : "ActivityLogSection"
                            }
                          },
                          "domainType" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                          },
                          "duration" : {
                            "_type" : {
                              "_name" : "Double"
                            },
                            "_value" : "41.27573120594025"
                          },
                          "emittedOutput" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Test Suite 'XCTestHTMLReportSampleAppUITests.xctest' started at 2019-10-03 15:38:08.070\\nTest Suite 'FirstSuite' started at 2019-10-03 15:38:08.071\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\nTest Suite 'FirstSuite' passed at 2019-10-03 15:38:25.923.\\n\\t Executed 3 tests, with 0 failures (0 unexpected) in 17.851 (17.853) seconds\\nTest Suite 'SecondSuite' started at 2019-10-03 15:38:25.924\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:31.686\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83161\\n    t =     3.79s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.27s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\nTest Suite 'SecondSuite' failed at 2019-10-03 15:38:37.445.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 11.520 (11.521) seconds\\nTest Suite 'ThirdSuite' started at 2019-10-03 15:38:37.446\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:37.447\\n    t =     0.03s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83206\\n    t =     3.92s             Setting up automation session\\n    t =     4.46s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.67s test Activity - Success\\n    t =     5.67s test Activity - Failure\\n    t =     5.67s     Assertion Failure: ThirdSuite.swift:29: XCTAssertTrue failed - Test failed\\n    t =     5.72s test Activity with sub-activities\\n    t =     5.72s     test sub Activity 0 - Failure\\n    t =     5.72s         Assertion Failure: ThirdSuite.swift:33: XCTAssertTrue failed - Test failed\\n    t =     5.72s     test sub Activity 1 - Success\\n    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\nTest Suite 'ThirdSuite' failed at 2019-10-03 15:38:49.353.\\n\\t Executed 2 tests, with 3 failures (0 unexpected) in 11.905 (11.907) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUITests.xctest' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.284) seconds\\n"
                          },
                          "result" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "succeeded"
                          },
                          "startTime" : {
                            "_type" : {
                              "_name" : "Date"
                            },
                            "_value" : "2019-10-03T15:38:08.072+0200"
                          },
                          "subsections" : {
                            "_type" : {
                              "_name" : "Array"
                            },
                            "_values" : [
                              {
                                "_type" : {
                                  "_name" : "ActivityLogUnitTestSection",
                                  "_supertype" : {
                                    "_name" : "ActivityLogSection"
                                  }
                                },
                                "domainType" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                },
                                "duration" : {
                                  "_type" : {
                                    "_name" : "Double"
                                  },
                                  "_value" : "17.850802063941956"
                                },
                                "emittedOutput" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'FirstSuite' started at 2019-10-03 15:38:08.071\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\nTest Suite 'FirstSuite' passed at 2019-10-03 15:38:25.923.\\n\\t Executed 3 tests, with 0 failures (0 unexpected) in 17.851 (17.853) seconds\\n"
                                },
                                "result" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "succeeded"
                                },
                                "startTime" : {
                                  "_type" : {
                                    "_name" : "Date"
                                  },
                                  "_value" : "2019-10-03T15:38:08.072+0200"
                                },
                                "subsections" : {
                                  "_type" : {
                                    "_name" : "Array"
                                  },
                                  "_values" : [
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "6.231536030769348"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:08.075+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "FirstSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     0.00s Start Test at 2019-10-03 15:38:08.072\\n    t =     0.07s Set Up\\n    t =     0.08s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.14s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     3.67s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.66s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     6.01s Added attachment named 'HTML'\\n    t =     6.01s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testDownloadAndAttachWebData]' passed (6.232 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testDownloadAndAttachWebData()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testDownloadAndAttachWebData()"
                                      }
                                    },
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.911841034889221"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:14.307+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "FirstSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     0.00s Start Test at 2019-10-03 15:38:14.304\\n    t =     0.06s Set Up\\n    t =     0.06s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.10s             Terminate com.tito.XCTestHTMLReportSampleApp:83089\\n    t =     4.03s             Wait for accessibility to load\\n    t =     4.15s             Setting up automation session\\n    t =     4.49s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.71s Text Attachment\\n    t =     5.71s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testOne]' passed (5.912 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testOne()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testOne()"
                                      }
                                    },
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.707424998283386"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:20.219+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "FirstSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     0.00s Start Test at 2019-10-03 15:38:20.216\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.09s             Terminate com.tito.XCTestHTMLReportSampleApp:83092\\n    t =     4.06s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.50s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.FirstSuite testTwo]' passed (5.707 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testTwo()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testTwo()"
                                      }
                                    }
                                  ]
                                },
                                "suiteName" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "FirstSuite"
                                },
                                "summary" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'FirstSuite' passed at 2019-10-03 15:38:25.923.\\n\\t Executed 3 tests, with 0 failures (0 unexpected) in 17.851 (17.853) seconds\\n"
                                },
                                "testsPassedString" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "3 out of 3 tests passed"
                                },
                                "title" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Run test suite FirstSuite"
                                }
                              },
                              {
                                "_type" : {
                                  "_name" : "ActivityLogUnitTestSection",
                                  "_supertype" : {
                                    "_name" : "ActivityLogSection"
                                  }
                                },
                                "domainType" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                },
                                "duration" : {
                                  "_type" : {
                                    "_name" : "Double"
                                  },
                                  "_value" : "11.52010202407837"
                                },
                                "emittedOutput" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'SecondSuite' started at 2019-10-03 15:38:25.924\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:31.686\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83161\\n    t =     3.79s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.27s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\nTest Suite 'SecondSuite' failed at 2019-10-03 15:38:37.445.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 11.520 (11.521) seconds\\n"
                                },
                                "result" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "succeeded"
                                },
                                "startTime" : {
                                  "_type" : {
                                    "_name" : "Date"
                                  },
                                  "_value" : "2019-10-03T15:38:25.926+0200"
                                },
                                "subsections" : {
                                  "_type" : {
                                    "_name" : "Array"
                                  },
                                  "_values" : [
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.761072993278503"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:25.927+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "SecondSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     0.00s Start Test at 2019-10-03 15:38:25.925\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83094\\n    t =     4.05s             Wait for accessibility to load\\n    t =     4.16s             Setting up automation session\\n    t =     4.24s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.56s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testOne]' passed (5.761 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testOne()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testOne()"
                                      }
                                    },
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.759029030799866"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:31.686\\n    t =     0.04s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83161\\n    t =     3.79s             Wait for accessibility to load\\n    t =     3.92s             Setting up automation session\\n    t =     4.27s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\n"
                                      },
                                      "messages" : {
                                        "_type" : {
                                          "_name" : "Array"
                                        },
                                        "_values" : [
                                          {
                                            "_type" : {
                                              "_name" : "ActivityLogMessage"
                                            },
                                            "location" : {
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
                                                "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUITests/SecondSuite.swift#CharacterRangeLen=0&EndingLineNumber=37&StartingLineNumber=37"
                                              }
                                            },
                                            "shortTitle" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "title" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "type" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "test failure"
                                            }
                                          }
                                        ]
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:31.689+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "SecondSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     5.72s Assertion Failure: SecondSuite.swift:38: XCTAssertTrue failed - Test failed\\n    t =     5.76s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.SecondSuite testTwo]' failed (5.759 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testTwo()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testTwo()"
                                      }
                                    }
                                  ]
                                },
                                "suiteName" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "SecondSuite"
                                },
                                "summary" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'SecondSuite' failed at 2019-10-03 15:38:37.445.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 11.520 (11.521) seconds\\n"
                                },
                                "testsPassedString" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "1 out of 2 tests passed"
                                },
                                "title" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Run test suite SecondSuite"
                                }
                              },
                              {
                                "_type" : {
                                  "_name" : "ActivityLogUnitTestSection",
                                  "_supertype" : {
                                    "_name" : "ActivityLogSection"
                                  }
                                },
                                "domainType" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                },
                                "duration" : {
                                  "_type" : {
                                    "_name" : "Double"
                                  },
                                  "_value" : "11.904827117919922"
                                },
                                "emittedOutput" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'ThirdSuite' started at 2019-10-03 15:38:37.446\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:37.447\\n    t =     0.03s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83206\\n    t =     3.92s             Setting up automation session\\n    t =     4.46s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.67s test Activity - Success\\n    t =     5.67s test Activity - Failure\\n    t =     5.67s     Assertion Failure: ThirdSuite.swift:29: XCTAssertTrue failed - Test failed\\n    t =     5.72s test Activity with sub-activities\\n    t =     5.72s     test sub Activity 0 - Failure\\n    t =     5.72s         Assertion Failure: ThirdSuite.swift:33: XCTAssertTrue failed - Test failed\\n    t =     5.72s     test sub Activity 1 - Success\\n    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\nTest Suite 'ThirdSuite' failed at 2019-10-03 15:38:49.353.\\n\\t Executed 2 tests, with 3 failures (0 unexpected) in 11.905 (11.907) seconds\\n"
                                },
                                "result" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "succeeded"
                                },
                                "startTime" : {
                                  "_type" : {
                                    "_name" : "Date"
                                  },
                                  "_value" : "2019-10-03T15:38:37.449+0200"
                                },
                                "subsections" : {
                                  "_type" : {
                                    "_name" : "Array"
                                  },
                                  "_values" : [
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.928067088127136"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:37.447\\n    t =     0.03s Set Up\\n    t =     0.04s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.07s             Terminate com.tito.XCTestHTMLReportSampleApp:83206\\n    t =     3.92s             Setting up automation session\\n    t =     4.46s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.67s test Activity - Success\\n    t =     5.67s test Activity - Failure\\n    t =     5.67s     Assertion Failure: ThirdSuite.swift:29: XCTAssertTrue failed - Test failed\\n    t =     5.72s test Activity with sub-activities\\n    t =     5.72s     test sub Activity 0 - Failure\\n    t =     5.72s         Assertion Failure: ThirdSuite.swift:33: XCTAssertTrue failed - Test failed\\n    t =     5.72s     test sub Activity 1 - Success\\n    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\n"
                                      },
                                      "messages" : {
                                        "_type" : {
                                          "_name" : "Array"
                                        },
                                        "_values" : [
                                          {
                                            "_type" : {
                                              "_name" : "ActivityLogMessage"
                                            },
                                            "location" : {
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
                                                "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUITests/ThirdSuite.swift#CharacterRangeLen=0&EndingLineNumber=28&StartingLineNumber=28"
                                              }
                                            },
                                            "shortTitle" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "title" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "type" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "test failure"
                                            }
                                          },
                                          {
                                            "_type" : {
                                              "_name" : "ActivityLogMessage"
                                            },
                                            "location" : {
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
                                                "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUITests/ThirdSuite.swift#CharacterRangeLen=0&EndingLineNumber=32&StartingLineNumber=32"
                                              }
                                            },
                                            "shortTitle" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "title" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "type" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "test failure"
                                            }
                                          },
                                          {
                                            "_type" : {
                                              "_name" : "ActivityLogMessage"
                                            },
                                            "location" : {
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
                                                "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUITests/ThirdSuite.swift#CharacterRangeLen=0&EndingLineNumber=38&StartingLineNumber=38"
                                              }
                                            },
                                            "shortTitle" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "title" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "type" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "test failure"
                                            }
                                          }
                                        ]
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:37.449+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "ThirdSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     5.72s Assertion Failure: ThirdSuite.swift:39: XCTAssertTrue failed - Test failed\\n    t =     5.72s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testOne]' failed (5.928 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testOne()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testOne()"
                                      }
                                    },
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "5.976760029792786"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' started.\\n    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:43.378+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "ThirdSuite"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "    t =     0.00s Start Test at 2019-10-03 15:38:43.376\\n    t =     0.05s Set Up\\n    t =     0.05s     Open com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s         Launch com.tito.XCTestHTMLReportSampleApp\\n    t =     0.08s             Terminate com.tito.XCTestHTMLReportSampleApp:83209\\n    t =     3.88s             Setting up automation session\\n    t =     4.29s             Wait for com.tito.XCTestHTMLReportSampleApp to idle\\n    t =     5.77s Tear Down\\nTest Case '-[XCTestHTMLReportSampleAppUITests.ThirdSuite testTwo]' passed (5.977 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testTwo()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testTwo()"
                                      }
                                    }
                                  ]
                                },
                                "suiteName" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "ThirdSuite"
                                },
                                "summary" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'ThirdSuite' failed at 2019-10-03 15:38:49.353.\\n\\t Executed 2 tests, with 3 failures (0 unexpected) in 11.905 (11.907) seconds\\n"
                                },
                                "testsPassedString" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "1 out of 2 tests passed"
                                },
                                "title" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Run test suite ThirdSuite"
                                }
                              }
                            ]
                          },
                          "suiteName" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "XCTestHTMLReportSampleAppUITests.xctest"
                          },
                          "summary" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Test Suite 'XCTestHTMLReportSampleAppUITests.xctest' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.284) seconds\\n"
                          },
                          "testsPassedString" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "5 out of 7 tests passed"
                          },
                          "title" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Run test suite XCTestHTMLReportSampleAppUITests.xctest"
                          }
                        }
                      ]
                    },
                    "suiteName" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "All tests"
                    },
                    "summary" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Test Suite 'All tests' failed at 2019-10-03 15:38:49.354.\\n\\t Executed 7 tests, with 4 failures (0 unexpected) in 41.276 (41.286) seconds\\n"
                    },
                    "testsPassedString" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "5 out of 7 tests passed"
                    },
                    "title" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Run test suite All tests"
                    }
                  }
                ]
              },
              "testsPassedString" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "5 out of 7 tests passed"
              },
              "title" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "XCTestHTMLReportSampleAppUITests-Runner.app (83084)"
              }
            }
          ]
        },
        "subtitle" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Destination iPhone Xs Max"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Test target XCTestHTMLReportSampleAppUITests"
        }
      },
      {
        "_type" : {
          "_name" : "ActivityLogMajorSection",
          "_supertype" : {
            "_name" : "ActivityLogSection"
          }
        },
        "domainType" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "com.apple.dt.unit.cocoaUnitTest"
        },
        "duration" : {
          "_type" : {
            "_name" : "Double"
          },
          "_value" : "4.515720009803772"
        },
        "result" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "succeeded"
        },
        "startTime" : {
          "_type" : {
            "_name" : "Date"
          },
          "_value" : "2019-10-03T15:38:49.699+0200"
        },
        "subsections" : {
          "_type" : {
            "_name" : "Array"
          },
          "_values" : [
            {
              "_type" : {
                "_name" : "ActivityLogUnitTestSection",
                "_supertype" : {
                  "_name" : "ActivityLogSection"
                }
              },
              "domainType" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "com.apple.dt.IDE.UnitTestLogSection.Worker"
              },
              "duration" : {
                "_type" : {
                  "_name" : "Double"
                },
                "_value" : "0.017937898635864258"
              },
              "emittedOutput" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "2019-10-03 15:38:53.116540+0200 XCTestHTMLReportSampleApp[83223:14616367] Launching with XCTest injected. Preparing to run tests.\\n2019-10-03 15:38:53.133393+0200 XCTestHTMLReportSampleApp[83223:14616367] Waiting to run tests until the app finishes launching.\\n2019-10-03 15:38:53.367161+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.367299+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:53.404716+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.413360+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.414159+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unexpected physical screen orientation\\nTest Suite 'All tests' started at 2019-10-03 15:38:53.835\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' started at 2019-10-03 15:38:53.838\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' started at 2019-10-03 15:38:53.840\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' started.\\n/Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift:15: error: -[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure] : XCTAssertTrue failed - Test failed\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' started.\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' failed at 2019-10-03 15:38:53.861.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.020) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.024) seconds\\nTest Suite 'All tests' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.028) seconds\\n"
              },
              "result" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "succeeded"
              },
              "runnablePath" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "/Users/felginep/Library/Developer/Xcode/DerivedData/XCTestHTMLReportSampleApp-fmywasfnsjxoiucjtawjnsntkdkc/Build/Products/Debug-iphonesimulator/XCTestHTMLReportSampleApp.app"
              },
              "runnableUTI" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "com.apple.application-bundle"
              },
              "startTime" : {
                "_type" : {
                  "_name" : "Date"
                },
                "_value" : "2019-10-03T15:38:49.699+0200"
              },
              "subsections" : {
                "_type" : {
                  "_name" : "Array"
                },
                "_values" : [
                  {
                    "_type" : {
                      "_name" : "ActivityLogCommandInvocationSection",
                      "_supertype" : {
                        "_name" : "ActivityLogSection"
                      }
                    },
                    "commandDetails" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUnitTests-6F422EE2-0C31-488E-ADE9-5A3AC9C085BB/XCTestHTMLReportSampleAppUnitTests-7AD3AEC4-E477-48C0-9804-00ED8A335656/Session-XCTestHTMLReportSampleAppUnitTests-2019-10-03_153849-FzLc7W.log"
                    },
                    "domainType" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                    },
                    "duration" : {
                      "_type" : {
                        "_name" : "Double"
                      },
                      "_value" : "7.700920104980469e-05"
                    },
                    "messages" : {
                      "_type" : {
                        "_name" : "Array"
                      },
                      "_values" : [
                        {
                          "_type" : {
                            "_name" : "ActivityLogMessage"
                          },
                          "location" : {
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
                              "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUnitTests-6F422EE2-0C31-488E-ADE9-5A3AC9C085BB/XCTestHTMLReportSampleAppUnitTests-7AD3AEC4-E477-48C0-9804-00ED8A335656/Session-XCTestHTMLReportSampleAppUnitTests-2019-10-03_153849-FzLc7W.log#CharacterRangeLen=0"
                            }
                          },
                          "shortTitle" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUnitTests-6F422EE2-0C31-488E-ADE9-5A3AC9C085BB/XCTestHTMLReportSampleAppUnitTests-7AD3AEC4-E477-48C0-9804-00ED8A335656/Session-XCTestHTMLReportSampleAppUnitTests-2019-10-03_153849-FzLc7W.log"
                          },
                          "title" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "/Users/felginep/Sources/XCTestHTMLReport/TestResultsB/Staging/1_Test/Diagnostics/XCTestHTMLReportSampleAppUnitTests-6F422EE2-0C31-488E-ADE9-5A3AC9C085BB/XCTestHTMLReportSampleAppUnitTests-7AD3AEC4-E477-48C0-9804-00ED8A335656/Session-XCTestHTMLReportSampleAppUnitTests-2019-10-03_153849-FzLc7W.log"
                          },
                          "type" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "notice"
                          }
                        }
                      ]
                    },
                    "result" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "succeeded"
                    },
                    "startTime" : {
                      "_type" : {
                        "_name" : "Date"
                      },
                      "_value" : "2019-10-03T15:38:49.699+0200"
                    },
                    "title" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Writing diagnostic log for test session. Please attach this log to any test-related bug reports."
                    }
                  },
                  {
                    "_type" : {
                      "_name" : "ActivityLogUnitTestSection",
                      "_supertype" : {
                        "_name" : "ActivityLogSection"
                      }
                    },
                    "domainType" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                    },
                    "duration" : {
                      "_type" : {
                        "_name" : "Double"
                      },
                      "_value" : "0.017937898635864258"
                    },
                    "emittedOutput" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "2019-10-03 15:38:53.116540+0200 XCTestHTMLReportSampleApp[83223:14616367] Launching with XCTest injected. Preparing to run tests.\\n2019-10-03 15:38:53.133393+0200 XCTestHTMLReportSampleApp[83223:14616367] Waiting to run tests until the app finishes launching.\\n2019-10-03 15:38:53.367161+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.367299+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unexpected physical screen orientation\\n2019-10-03 15:38:53.404716+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.413360+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unable to look up screen scale\\n2019-10-03 15:38:53.414159+0200 XCTestHTMLReportSampleApp[83223:14616367] [AXMediaCommon] Unexpected physical screen orientation\\nTest Suite 'All tests' started at 2019-10-03 15:38:53.835\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' started at 2019-10-03 15:38:53.838\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' started at 2019-10-03 15:38:53.840\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' started.\\n/Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift:15: error: -[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure] : XCTAssertTrue failed - Test failed\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' started.\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' failed at 2019-10-03 15:38:53.861.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.020) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.024) seconds\\nTest Suite 'All tests' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.028) seconds\\n"
                    },
                    "result" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "succeeded"
                    },
                    "startTime" : {
                      "_type" : {
                        "_name" : "Date"
                      },
                      "_value" : "2019-10-03T15:38:53.839+0200"
                    },
                    "subsections" : {
                      "_type" : {
                        "_name" : "Array"
                      },
                      "_values" : [
                        {
                          "_type" : {
                            "_name" : "ActivityLogUnitTestSection",
                            "_supertype" : {
                              "_name" : "ActivityLogSection"
                            }
                          },
                          "domainType" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                          },
                          "duration" : {
                            "_type" : {
                              "_name" : "Double"
                            },
                            "_value" : "0.017937898635864258"
                          },
                          "emittedOutput" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Test Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' started at 2019-10-03 15:38:53.838\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' started at 2019-10-03 15:38:53.840\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' started.\\n/Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift:15: error: -[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure] : XCTAssertTrue failed - Test failed\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' started.\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' failed at 2019-10-03 15:38:53.861.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.020) seconds\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.024) seconds\\n"
                          },
                          "result" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "succeeded"
                          },
                          "startTime" : {
                            "_type" : {
                              "_name" : "Date"
                            },
                            "_value" : "2019-10-03T15:38:53.842+0200"
                          },
                          "subsections" : {
                            "_type" : {
                              "_name" : "Array"
                            },
                            "_values" : [
                              {
                                "_type" : {
                                  "_name" : "ActivityLogUnitTestSection",
                                  "_supertype" : {
                                    "_name" : "ActivityLogSection"
                                  }
                                },
                                "domainType" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                },
                                "duration" : {
                                  "_type" : {
                                    "_name" : "Double"
                                  },
                                  "_value" : "0.017937898635864258"
                                },
                                "emittedOutput" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'XCTestHTMLReportSampleAppUnitTests' started at 2019-10-03 15:38:53.840\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' started.\\n/Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift:15: error: -[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure] : XCTAssertTrue failed - Test failed\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' started.\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\nTest Suite 'XCTestHTMLReportSampleAppUnitTests' failed at 2019-10-03 15:38:53.861.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.020) seconds\\n"
                                },
                                "result" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "succeeded"
                                },
                                "startTime" : {
                                  "_type" : {
                                    "_name" : "Date"
                                  },
                                  "_value" : "2019-10-03T15:38:53.843+0200"
                                },
                                "subsections" : {
                                  "_type" : {
                                    "_name" : "Array"
                                  },
                                  "_values" : [
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "0.017200946807861328"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' started.\\n/Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift:15: error: -[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure] : XCTAssertTrue failed - Test failed\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\n"
                                      },
                                      "messages" : {
                                        "_type" : {
                                          "_name" : "Array"
                                        },
                                        "_values" : [
                                          {
                                            "_type" : {
                                              "_name" : "ActivityLogMessage"
                                            },
                                            "location" : {
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
                                                "_value" : "file:///Users/felginep/Sources/XCTestHTMLReport/XCTestHTMLReportSampleApp/XCTestHTMLReportSampleAppUnitTests/XCTestHTMLReportSampleAppUnitTests.swift#CharacterRangeLen=0&EndingLineNumber=14&StartingLineNumber=14"
                                              }
                                            },
                                            "shortTitle" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "title" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "XCTAssertTrue failed - Test failed"
                                            },
                                            "type" : {
                                              "_type" : {
                                                "_name" : "String"
                                              },
                                              "_value" : "test failure"
                                            }
                                          }
                                        ]
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:53.864+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "XCTestHTMLReportSampleAppUnitTests"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testFailure]' failed (0.017 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testFailure()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testFailure()"
                                      }
                                    },
                                    {
                                      "_type" : {
                                        "_name" : "ActivityLogUnitTestSection",
                                        "_supertype" : {
                                          "_name" : "ActivityLogSection"
                                        }
                                      },
                                      "domainType" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "com.apple.dt.IDE.UnitTestLogSection"
                                      },
                                      "duration" : {
                                        "_type" : {
                                          "_name" : "Double"
                                        },
                                        "_value" : "0.0007369518280029297"
                                      },
                                      "emittedOutput" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' started.\\nTest Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\n"
                                      },
                                      "result" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "succeeded"
                                      },
                                      "startTime" : {
                                        "_type" : {
                                          "_name" : "Date"
                                        },
                                        "_value" : "2019-10-03T15:38:53.865+0200"
                                      },
                                      "suiteName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "XCTestHTMLReportSampleAppUnitTests"
                                      },
                                      "summary" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Test Case '-[XCTestHTMLReportSampleAppUnitTests.XCTestHTMLReportSampleAppUnitTests testSuccess]' passed (0.001 seconds).\\n"
                                      },
                                      "testName" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "testSuccess()"
                                      },
                                      "title" : {
                                        "_type" : {
                                          "_name" : "String"
                                        },
                                        "_value" : "Run test case testSuccess()"
                                      }
                                    }
                                  ]
                                },
                                "suiteName" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "XCTestHTMLReportSampleAppUnitTests"
                                },
                                "summary" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Test Suite 'XCTestHTMLReportSampleAppUnitTests' failed at 2019-10-03 15:38:53.861.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.020) seconds\\n"
                                },
                                "testsPassedString" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "1 out of 2 tests passed"
                                },
                                "title" : {
                                  "_type" : {
                                    "_name" : "String"
                                  },
                                  "_value" : "Run test suite XCTestHTMLReportSampleAppUnitTests"
                                }
                              }
                            ]
                          },
                          "suiteName" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "XCTestHTMLReportSampleAppUnitTests.xctest"
                          },
                          "summary" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Test Suite 'XCTestHTMLReportSampleAppUnitTests.xctest' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.024) seconds\\n"
                          },
                          "testsPassedString" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "1 out of 2 tests passed"
                          },
                          "title" : {
                            "_type" : {
                              "_name" : "String"
                            },
                            "_value" : "Run test suite XCTestHTMLReportSampleAppUnitTests.xctest"
                          }
                        }
                      ]
                    },
                    "suiteName" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "All tests"
                    },
                    "summary" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Test Suite 'All tests' failed at 2019-10-03 15:38:53.862.\\n\\t Executed 2 tests, with 1 failure (0 unexpected) in 0.018 (0.028) seconds\\n"
                    },
                    "testsPassedString" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "1 out of 2 tests passed"
                    },
                    "title" : {
                      "_type" : {
                        "_name" : "String"
                      },
                      "_value" : "Run test suite All tests"
                    }
                  }
                ]
              },
              "testsPassedString" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "1 out of 2 tests passed"
              },
              "title" : {
                "_type" : {
                  "_name" : "String"
                },
                "_value" : "XCTestHTMLReportSampleApp.app (83223)"
              }
            }
          ]
        },
        "subtitle" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Destination iPhone Xs Max"
        },
        "title" : {
          "_type" : {
            "_name" : "String"
          },
          "_value" : "Test target XCTestHTMLReportSampleAppUnitTests"
        }
      }
    ]
  },
  "title" : {
    "_type" : {
      "_name" : "String"
    },
    "_value" : "Test XCTestHTMLReportSampleApp"
  }
}
"""
}
