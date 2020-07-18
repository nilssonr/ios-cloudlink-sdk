import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CLAuthenticationClientTests.allTests),
        testCase(CLRouterClientTests.allTests)
    ]
}
#endif
