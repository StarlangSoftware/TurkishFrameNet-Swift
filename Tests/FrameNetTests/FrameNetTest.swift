import XCTest
@testable import FrameNet

final class FrameNetTest: XCTestCase {
    var frameNet : FrameNet = FrameNet()

    override func setUp(){
        self.frameNet = FrameNet()
    }

    func testFrameSize() {
        XCTAssertEqual(101, self.frameNet.size())
    }

    func testLexicalUnitSize() {
        var count : Int = 0
        for i in 0..<frameNet.size(){
            count += frameNet.getFrame(index: i).size()
        }
        XCTAssertEqual(2001, count);
    }

    func testFrameElementSize() {
        var count : Int = 0
        for i in 0..<frameNet.size(){
            for j in 0..<frameNet.getFrame(index: i).size(){
                count += frameNet.getFrame(index: i).getLexicalUnit(index: j).size();
            }
        }
        XCTAssertEqual(8624, count);
    }

    func testDistinctFrameElements() {
        var elements = Set<String>()
        for i in 0..<frameNet.size(){
            for j in 0..<frameNet.getFrame(index: i).size(){
                for element in frameNet.getFrame(index: i).getLexicalUnit(index: j).getFrameElements(){
                    elements.insert(element)
                }
            }
        }
        XCTAssertEqual(179, elements.count);
    }

    static var allTests = [
        ("testExample1", testFrameSize),
        ("testExample2", testLexicalUnitSize),
        ("testExample3", testFrameElementSize),
        ("testExample4", testDistinctFrameElements),
    ]
}