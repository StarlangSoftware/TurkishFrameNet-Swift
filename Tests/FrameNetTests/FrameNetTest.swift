import XCTest
@testable import FrameNet

final class FrameNetTest: XCTestCase {
    var frameNet : FrameNet = FrameNet()

    override func setUp(){
        self.frameNet = FrameNet()
    }

    func testFrameSize() {
        XCTAssertEqual(139, self.frameNet.size())
    }

    func testLexicalUnitSize() {
        var count : Int = 0
        for i in 0..<frameNet.size(){
            count += frameNet.getFrame(index: i).lexicalUnitSize()
        }
        XCTAssertEqual(2561, count);
    }

    func testFrameElementSize() {
        var count : Int = 0
        for i in 0..<frameNet.size(){
            count += frameNet.getFrame(index: i).frameElementSize();
        }
        XCTAssertEqual(1665, count);
    }

    func testDistinctFrameElements() {
        var elements = Set<String>()
        for i in 0..<frameNet.size(){
            for j in 0..<frameNet.getFrame(index: i).frameElementSize(){
                elements.insert(frameNet.getFrame(index: i).getFrameElement(index: j))
            }
        }
        XCTAssertEqual(289, elements.count);
    }

    static var allTests = [
        ("testExample1", testFrameSize),
        ("testExample2", testLexicalUnitSize),
        ("testExample3", testFrameElementSize),
        ("testExample4", testDistinctFrameElements),
    ]
}
