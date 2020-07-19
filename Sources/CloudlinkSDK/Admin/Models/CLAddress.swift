public struct CLAddress: Codable {
    public var country: String
    public var street: String
    public var city: String
    public var stateOrProvince: String
    public var zipCode: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case street
        case city
        case stateOrProvince
        case zipCode
    }
}
