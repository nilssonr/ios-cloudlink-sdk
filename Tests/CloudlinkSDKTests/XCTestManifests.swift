import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CLAuthenticationClientTests.allTests),
        testCase(CLRouterClientTests.allTests),
        testCase(CLAdminClientTests.allTests)
    ]
}
#endif
