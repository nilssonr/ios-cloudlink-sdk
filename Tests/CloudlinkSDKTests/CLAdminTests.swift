import XCTest
@testable import CloudlinkSDK

final class CLAdminClientTests: XCTestCase {
    static var allTests = [
        ("test_getAccount", test_getAccount),
        ("test_getContacts", test_getContacts),
        ("test_getContact", test_getContact)
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
    
    func test_getContacts() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getAccountContact")
        
        ClAuthenticationClient.instance().whoAmI() { result in
            switch(result) {
            case .success(let data):
                admin.getContacts(accountId: data.accountId) { result in
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
    
    func test_getContact() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getContact")
        
        ClAuthenticationClient.instance().whoAmI() { result in
            switch(result) {
            case .success(let data):
                admin.getContacts(accountId: data.accountId) { result in
                    switch(result) {
                    case .success(let data):
                        admin.getContact(accountId: data.embedded.items[0].accountId, contactId: data.embedded.items[0].contactId) { result in
                            switch(result) {
                            case .success(let data):
                                XCTAssertNotNil(data.accountId)
                                exp.fulfill()
                            case .failure(let error):
                                fatalError(error.localizedDescription)
                            }
                        }
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
