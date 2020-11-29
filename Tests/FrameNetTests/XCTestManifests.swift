import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FrameNetTests.allTests),
        testCase(FrameElementTest.allTests),
    ]
}
#endif
