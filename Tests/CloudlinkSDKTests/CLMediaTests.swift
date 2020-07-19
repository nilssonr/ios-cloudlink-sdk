import XCTest
@testable import CloudlinkSDK

final class CLMediaClientTests : XCTestCase {
    static var allTests = [
        ("test_getCalls", test_getCalls)
    ]
    
    override func setUp() {
        let testToken = TestTokenRequest()
        let tokenRequest = CLTokenRequest(accountId: testToken.accountId, username: testToken.username, password: testToken.password, grantType: testToken.grantType)
        let exp = expectation(description: "acquire_token")
        
        CLAuthenticationClient.instance().getToken(request: tokenRequest) { response in
            switch(response) {
            case .success(_):
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getCalls() {
        let media = CLMediaClient()
        let exp = expectation(description: "test_getCalls")
        
        media.getCalls() { result in
            switch(result) {
            case .success(let data):
                XCTAssertGreaterThan(data.count, 0)
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
