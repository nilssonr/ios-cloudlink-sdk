struct CLToken : Codable {
    var tokenType: String
    var expiresIn: Int
    var accessToken: String
    var refreshToken: String
    var scope: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case scope = "scope"
    }
}
