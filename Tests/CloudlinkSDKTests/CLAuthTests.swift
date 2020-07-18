import XCTest
@testable import CloudlinkSDK

final class CLAuthenticationClientTests : XCTestCase {
    static var allTests = [
        ("test_whoAmI", test_whoAmI)
    ]
    
    override func setUp() {
        let testToken = TestTokenRequest()
        let tokenRequest = CLTokenRequest(accountId: testToken.accountId, username: testToken.username, password: testToken.password, grantType: testToken.grantType)
        let exp = expectation(description: "acquire_token")
        
        ClAuthenticationClient.instance().getToken(request: tokenRequest) { response in
            switch(response) {
            case .success(_):
                XCTAssertGreaterThan(ClAuthenticationClient.instance().token.expiresIn, 0)
                XCTAssertNotNil(ClAuthenticationClient.instance().token.accessToken)
                XCTAssertNotNil(ClAuthenticationClient.instance().token.refreshToken)
                XCTAssertEqual(ClAuthenticationClient.instance().token.tokenType, "bearer")
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func test_whoAmI() {
        let exp = expectation(description: "test_whoAmI")
        
        ClAuthenticationClient.instance().whoAmI() { response in
            switch(response) {
            case .success(let data):
                XCTAssertEqual(data.email, "robin.nilsson@mitel.com")
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
