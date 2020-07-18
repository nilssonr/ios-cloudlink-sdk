import XCTest
@testable import CloudlinkSDK

final class CLRouterClientTests : XCTestCase {
    static var allTests = [
        ("test_getSkills", test_getSkills)
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
    
    func test_getSkills() {
        let router = CLRouterClient()
        let exp = expectation(description: "test_getSkills")
                
        router.getSkills() { response in
            switch(response) {
                case .success(let data):
                    debugPrint(data)
                case .failure(let error):
                    fatalError(error.localizedDescription)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
