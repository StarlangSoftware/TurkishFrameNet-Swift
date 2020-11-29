import XCTest
@testable import FrameNet

final class FrameElementTest: XCTestCase {

    func testFrameElement() {
        let frameElement : FrameElement = FrameElement(frameElement: "Agent$Apply_Heat$TUR10-0100230");
        XCTAssertEqual("Agent", frameElement.getFrameElementType());
        XCTAssertEqual("Apply_Heat", frameElement.getFrame());
        XCTAssertEqual("TUR10-0100230", frameElement.getId());
        XCTAssertEqual("Agent$Apply_Heat$TUR10-0100230", frameElement.description());
    }

    static var allTests = [
        ("testExample1", testFrameElement)
    ]
}
