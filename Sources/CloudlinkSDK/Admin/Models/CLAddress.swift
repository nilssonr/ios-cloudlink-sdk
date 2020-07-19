public struct CLAddress : Codable {
    var country: String
    var street: String
    var city: String
    var stateOrProvince: String
    var zipCode: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case street
        case city
        case stateOrProvince
        case zipCode
    }
}
