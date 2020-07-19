import XCTest
@testable import CloudlinkSDK

final class CLRouterClientTests : XCTestCase {
    static var allTests = [
        ("test_createDeleteSkill", test_createDeleteSkill),
        ("test_getManyGetOne", test_getManyGetOne)
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
    
    func test_createDeleteSkill() {
        let router = CLRouterClient()
        let exp = expectation(description: "test_createDeleteSkill")
                
        router.createSkill(name: "iOS-SDK-TestSkill") { response in
            switch(response) {
            case .success(let data):
                XCTAssertEqual(data.name, "iOS-SDK-TestSkill")
                
                router.deleteSkill(skillId: data.skillId) { response in
                    switch(response) {
                    case .success(let data):
                        XCTAssertTrue(data)
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
    
    func test_getManyGetOne() {
        let router = CLRouterClient()
        let exp = expectation(description: "test_getManyGetOne")
        
        router.getSkills() { response in
            switch(response) {
            case .success(let data):
                XCTAssertGreaterThan(data.count, 0)
                exp.fulfill()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getInteractions() {
        let router = CLRouterClient()
        let exp = expectation(description: "test_getInteractions")
        
        router.getInteractions() { response in
            switch(response) {
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
