public struct CLToken: Codable {
    public var tokenType: String
    public var expiresIn: Int
    public var accessToken: String
    public var refreshToken: String
    public var scope: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case scope = "scope"
    }
}
