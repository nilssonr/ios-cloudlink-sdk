public struct CLTokenRequest {
    public var accountId: String;
    public var username: String;
    public var password: String;
    public var grantType: String;
    
    public init(accountId: String, username: String, password: String, grantType: String) {
        self.accountId = accountId
        self.username = username
        self.password = password
        self.grantType = grantType
    }
}
