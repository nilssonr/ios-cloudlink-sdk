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
        
        CLAuthenticationClient.instance().getToken(request: tokenRequest) { response in
            switch(response) {
            case .success(_):
                XCTAssertGreaterThan(CLAuthenticationClient.instance().token!.expiresIn, 0)
                XCTAssertNotNil(CLAuthenticationClient.instance().token!.accessToken)
                XCTAssertNotNil(CLAuthenticationClient.instance().token!.refreshToken)
                XCTAssertEqual(CLAuthenticationClient.instance().token!.tokenType, "bearer")
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_refreshToken() {
        let exp = expectation(description: "test_refreshToken")
        
        CLAuthenticationClient.instance().getRefreshToken() { response in
            switch(response.result) {
            case .success(let data):
                XCTAssertEqual(data.tokenType, "bearer")
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func test_whoAmI() {
        let exp = expectation(description: "test_whoAmI")
        
        CLAuthenticationClient.instance().whoAmI() { response in
            switch(response.result) {
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
