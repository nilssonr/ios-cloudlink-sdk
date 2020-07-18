struct CLConnectedParty : Codable {
    var accountId: String
    var siteId: String
    var userId: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case accountId
        case siteId
        case userId
        case name
    }
}
