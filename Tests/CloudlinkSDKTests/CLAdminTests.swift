import XCTest
@testable import CloudlinkSDK

final class CLAdminClientTests: XCTestCase {
    static var allTests = [
        ("test_getAccount", test_getAccount),
        ("test_getContacts", test_getContacts),
        ("test_getContact", test_getContact),
        ("test_getUsers", test_getUsers),
        ("test_getUser", test_getUser),
        ("test_getTag", test_getTag)
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
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getAccount() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getAccount")
        
        CLAuthenticationClient.instance().whoAmI() { response in
            switch(response.result) {
            case .success(let data):
                admin.getAccount(accountId: data.accountId) { response in
                    switch(response.result) {
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
        
        CLAuthenticationClient.instance().whoAmI() { response in
            switch(response.result) {
            case .success(let data):
                admin.getContacts(accountId: data.accountId) { response in
                    switch(response.result) {
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
        
        CLAuthenticationClient.instance().whoAmI() { response in
            switch(response.result) {
            case .success(let data):
                admin.getContacts(accountId: data.accountId) { response in
                    switch(response.result) {
                    case .success(let data):
                        admin.getContact(accountId: data.embedded.items[0].accountId, contactId: data.embedded.items[0].contactId) { response in
                            switch(response.result) {
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
    
    func test_getUsers() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getUsers")
        
        admin.getUsers() { response in
            switch(response.result) {
            case .success(let data):
                XCTAssertGreaterThan(data.count, 0)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            exp.fulfill()
        }

        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func test_getUser() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getUser")

        admin.getUsers() { response in
            switch(response.result) {
            case .success(let data):
                admin.getUser(userId: data.embedded.items[0].userId!) { response in
                    switch(response.result) {
                    case .success(let data):
                        XCTAssertNotNil(data.email)
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
    
    func test_getTag() {
        let admin = CLAdminClient()
        let exp = expectation(description: "test_getTag")
        
        CLAuthenticationClient.instance().whoAmI() { response in
            switch(response.result) {
            case .success(let data):
                admin.getUserTag(userId: data.userId, tagId: "cx") { response in
                    switch(response.result) {
                    case .success(let data):
                        XCTAssertNotNil(data.links)
                        exp.fulfill()
                    case .failure(let error):
                        XCTFail(error.localizedDescription)
                    }
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
