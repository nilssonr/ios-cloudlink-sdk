public struct CLPolicy: Codable {
    public var allowGuestAccess: Bool
    public var allowProxyAuthentication: Bool
    
    enum CodingKeys: String, CodingKey {
        case allowGuestAccess
        case allowProxyAuthentication
    }
}
