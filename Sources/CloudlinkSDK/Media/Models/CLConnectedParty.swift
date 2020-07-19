public struct CLConnectedParty : Codable {
    public var accountId: String
    public var siteId: String
    public var userId: String
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case accountId
        case siteId
        case userId
        case name
    }
}
