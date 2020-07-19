public struct CLLocation : Codable {
    var address: CLAddress
    
    enum CodingKeys: String, CodingKey {
        case address
    }
}
