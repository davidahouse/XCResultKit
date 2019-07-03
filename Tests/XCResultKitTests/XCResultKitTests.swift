import XCTest
@testable import XCResultKit

final class XCResultKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XCResultKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
