public struct CLTokenRequest {
    var accountId: String;
    var username: String;
    var password: String;
    var grantType: String;
    
    public init(accountId: String, username: String, password: String, grantType: String) {
        self.accountId = accountId
        self.username = username
        self.password = password
        self.grantType = grantType
    }
}
