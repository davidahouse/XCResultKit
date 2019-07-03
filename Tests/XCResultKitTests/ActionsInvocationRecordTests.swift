import XCTest
@testable import XCResultKit

final class ActionsInvocationRecordTests: XCTestCase {

    func testCanParseCorrectlyFormattedJSON() {
        
        let record = ActionsInvocationRecord(parse(validActionsInvocationRecord))
        XCTAssertNotNil(record)
        XCTAssertEqual(record?.actions.count, 1)
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
    private let validActionsInvocationRecord = """
{
"_type" : {
"_name" : "ActionsInvocationRecord"
},
"actions" : {
"_type" : {
"_name" : "Array"
},
"_values" : [
{
"_type" : {
"_name" : "ActionRecord"
},
"actionResult" : {
"_type" : {
"_name" : "_ActionResult",
"_supertype" : {
"_name" : "ActionResult"
}
},
"coverage" : {
"_type" : {
"_name" : "CodeCoverageInfo"
}
},
"diagnosticsRef" : {
"_type" : {
"_name" : "Reference"
},
"id" : {
"_type" : {
"_name" : "String"
},
"_value" : "0~shbYjjUy1dlVIIFmGqLSe68b6X1Fnj906oGDUrcH-edLi_yA2LWf5e5Tn76wzQdosRyUgsakJw1mgqUMcSJx-Q=="
}
},
"issues" : {
"_type" : {
"_name" : "ResultIssueSummaries"
}
},
"logRef" : {
"_type" : {
"_name" : "Reference"
},
"id" : {
"_type" : {
"_name" : "String"
},
"_value" : "0~1S41-S1mazCIkZlJgZ9_7zHShINtXBlV2fl0XZmWCQCQCoGDC33okUF-HY0pMVxk7_sRr9EnL8l-I-7wjq4gaQ=="
},
"targetType" : {
"_type" : {
"_name" : "TypeDefinition"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "ActivityLogSection"
}
}
},
"metrics" : {
"_type" : {
"_name" : "ResultMetrics"
},
"testsCount" : {
"_type" : {
"_name" : "Int"
},
"_value" : "1"
}
},
"resultName" : {
"_type" : {
"_name" : "String"
},
"_value" : "action"
},
"status" : {
"_type" : {
"_name" : "String"
},
"_value" : "succeeded"
},
"testsRef" : {
"_type" : {
"_name" : "Reference"
},
"id" : {
"_type" : {
"_name" : "String"
},
"_value" : "0~ErmpG7NS2giQEqmayOq3K_jx9keEYfpXmeLNOiDE5C1uLKcgFkZM8TiwgypyUrtghq1i7iSiB_Q2ZsdAmVp-8Q=="
},
"targetType" : {
"_type" : {
"_name" : "TypeDefinition"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "ActionTestPlanRunSummaries"
}
}
}
},
"buildResult" : {
"_type" : {
"_name" : "_ActionResult",
"_supertype" : {
"_name" : "ActionResult"
}
},
"coverage" : {
"_type" : {
"_name" : "CodeCoverageInfo"
}
},
"issues" : {
"_type" : {
"_name" : "ResultIssueSummaries"
}
},
"logRef" : {
"_type" : {
"_name" : "Reference"
},
"id" : {
"_type" : {
"_name" : "String"
},
"_value" : "0~7jYop2hsw8D5KaTJYhBBarncDYtJYGCdY-vl_-00kLb3DcaXin7WGZV8mD1gej7m2qUjd-Zg130_7OzKo5OzMg=="
},
"targetType" : {
"_type" : {
"_name" : "TypeDefinition"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "ActivityLogSection"
}
}
},
"metrics" : {
"_type" : {
"_name" : "ResultMetrics"
}
},
"resultName" : {
"_type" : {
"_name" : "String"
},
"_value" : "build"
},
"status" : {
"_type" : {
"_name" : "String"
},
"_value" : "succeeded"
}
},
"endedTime" : {
"_type" : {
"_name" : "Date"
},
"_value" : "2019-06-30T07:32:58.289-0400"
},
"runDestination" : {
"_type" : {
"_name" : "ActionRunDestinationRecord"
},
"displayName" : {
"_type" : {
"_name" : "String"
},
"_value" : "iPhone Xʀ"
},
"localComputerRecord" : {
"_type" : {
"_name" : "ActionDeviceRecord"
},
"busSpeedInMHz" : {
"_type" : {
"_name" : "Int"
},
"_value" : "400"
},
"cpuCount" : {
"_type" : {
"_name" : "Int"
},
"_value" : "1"
},
"cpuKind" : {
"_type" : {
"_name" : "String"
},
"_value" : "Intel Core i7"
},
"cpuSpeedInMHz" : {
"_type" : {
"_name" : "Int"
},
"_value" : "3200"
},
"identifier" : {
"_type" : {
"_name" : "String"
},
"_value" : "C18708D7-27BB-5224-8759-FD07D1171E47"
},
"isConcreteDevice" : {
"_type" : {
"_name" : "Bool"
},
"_value" : "true"
},
"logicalCPUCoresPerPackage" : {
"_type" : {
"_name" : "Int"
},
"_value" : "12"
},
"modelCode" : {
"_type" : {
"_name" : "String"
},
"_value" : "Macmini8,1"
},
"modelName" : {
"_type" : {
"_name" : "String"
},
"_value" : "Mac mini"
},
"modelUTI" : {
"_type" : {
"_name" : "String"
},
"_value" : "com.apple.macmini-2018"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "My Mac"
},
"nativeArchitecture" : {
"_type" : {
"_name" : "String"
},
"_value" : "x86_64h"
},
"operatingSystemVersion" : {
"_type" : {
"_name" : "String"
},
"_value" : "10.15"
},
"operatingSystemVersionWithBuildNumber" : {
"_type" : {
"_name" : "String"
},
"_value" : "10.15 (19A487l)"
},
"physicalCPUCoresPerPackage" : {
"_type" : {
"_name" : "Int"
},
"_value" : "6"
},
"platformRecord" : {
"_type" : {
"_name" : "ActionPlatformRecord"
},
"identifier" : {
"_type" : {
"_name" : "String"
},
"_value" : "com.apple.platform.macosx"
},
"userDescription" : {
"_type" : {
"_name" : "String"
},
"_value" : "macOS"
}
},
"ramSizeInMegabytes" : {
"_type" : {
"_name" : "Int"
},
"_value" : "32768"
}
},
"targetArchitecture" : {
"_type" : {
"_name" : "String"
},
"_value" : "x86_64"
},
"targetDeviceRecord" : {
"_type" : {
"_name" : "ActionDeviceRecord"
},
"identifier" : {
"_type" : {
"_name" : "String"
},
"_value" : "D28DFA1E-4306-434D-826F-06B895418230"
},
"isConcreteDevice" : {
"_type" : {
"_name" : "Bool"
},
"_value" : "true"
},
"modelCode" : {
"_type" : {
"_name" : "String"
},
"_value" : "iPhone11,8"
},
"modelName" : {
"_type" : {
"_name" : "String"
},
"_value" : "iPhone Xʀ"
},
"modelUTI" : {
"_type" : {
"_name" : "String"
},
"_value" : "com.apple.iphone-xr-1"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "iPhone Xʀ"
},
"nativeArchitecture" : {
"_type" : {
"_name" : "String"
},
"_value" : "x86_64"
},
"operatingSystemVersion" : {
"_type" : {
"_name" : "String"
},
"_value" : "13.0"
},
"operatingSystemVersionWithBuildNumber" : {
"_type" : {
"_name" : "String"
},
"_value" : "13.0 (17A5508l)"
},
"platformRecord" : {
"_type" : {
"_name" : "ActionPlatformRecord"
},
"identifier" : {
"_type" : {
"_name" : "String"
},
"_value" : "com.apple.platform.iphonesimulator"
},
"userDescription" : {
"_type" : {
"_name" : "String"
},
"_value" : "iOS Simulator"
}
}
},
"targetSDKRecord" : {
"_type" : {
"_name" : "ActionSDKRecord"
},
"identifier" : {
"_type" : {
"_name" : "String"
},
"_value" : "iphonesimulator13.0"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "Simulator - iOS 13.0"
},
"operatingSystemVersion" : {
"_type" : {
"_name" : "String"
},
"_value" : "13.0"
}
}
},
"schemeCommandName" : {
"_type" : {
"_name" : "String"
},
"_value" : "Test"
},
"schemeTaskName" : {
"_type" : {
"_name" : "String"
},
"_value" : "BuildAndAction"
},
"startedTime" : {
"_type" : {
"_name" : "Date"
},
"_value" : "2019-06-30T07:32:55.937-0400"
}
}
]
},
"issues" : {
"_type" : {
"_name" : "ResultIssueSummaries"
}
},
"metadataRef" : {
"_type" : {
"_name" : "Reference"
},
"id" : {
"_type" : {
"_name" : "String"
},
"_value" : "0~kvArM7WnHb2ksUFCSz57JLvTar7obl1jgIoJiz5mzmdpyFVDlnjgrXffVh-g-kfdbsCgmFjV_h3R462BJzOa-g=="
},
"targetType" : {
"_type" : {
"_name" : "TypeDefinition"
},
"name" : {
"_type" : {
"_name" : "String"
},
"_value" : "ActionsInvocationMetadata"
}
}
},
"metrics" : {
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
}
"""

}
