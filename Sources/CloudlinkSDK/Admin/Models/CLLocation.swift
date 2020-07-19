public struct CLLocation: Codable {
    public var address: CLAddress
    
    enum CodingKeys: String, CodingKey {
        case address
    }
}
