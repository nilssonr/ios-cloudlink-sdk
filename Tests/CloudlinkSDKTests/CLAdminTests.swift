import XCTest
@testable import CloudlinkSDK

final class CLAdminClientTests: XCTestCase {
    static var allTests = [
        ("test_getAccount", test_getAccount),
        ("test_getAccountContacts", test_getAccountContacts)
    ]
    
    override func setUp() {
        let testToken = TestTokenRequest()
        let tokenRequest = CLTokenRequest(accountId: testToken.accountId, username: testToken.username, password: testToken.password, grantType: testToken.grantType)
        let exp = expectation(description: "acquire_token")
        
        ClAuthenticationClient.instance().getToken(request: tokenRequest) { response in
            switch(response) {
            case .success(_):
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getAccount() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getAccount")
        
        ClAuthenticationClient.instance().whoAmI() { result in
            switch(result) {
            case .success(let data):
                admin.getAccount(accountId: data.accountId) { result in
                    switch(result) {
                    case .success(let data):
                        XCTAssertGreaterThan(data.accessTokenExpiryHours, 0)
                        exp.fulfill()
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getAccountContacts() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getAccountContact")
        
        ClAuthenticationClient.instance().whoAmI() { result in
            switch(result) {
            case .success(let data):
                admin.getAccountContacts(accountId: data.accountId) { result in
                    switch(result) {
                    case .success(let data):
                        XCTAssertGreaterThan(data.count, 0)
                        exp.fulfill()
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
