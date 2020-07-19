public struct CLPolicy : Codable {
    var allowGuestAccess: Bool
    var allowProxyAuthentication: Bool
    
    enum CodingKeys: String, CodingKey {
        case allowGuestAccess
        case allowProxyAuthentication
    }
}
