import XCTest
@testable import FrameNet

final class FrameNetTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FrameNet().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
