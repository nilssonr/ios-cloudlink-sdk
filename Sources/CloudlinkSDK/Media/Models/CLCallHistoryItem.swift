struct CLCallHistoryItem : Codable {
    var callId: String
    var accountId: String
    var siteId: String
    var userId: String
    var direction: String
    var from: String
    var to: String
    var state: String
    var createdOn: String
    var sequenceNumber: String
    var connectedParty: CLConnectedParty
    var links: CLHttpResponseLinks
 
    enum CodingKeys: String, CodingKey {
        case callId
        case accountId
        case siteId
        case userId
        case direction
        case from
        case to
        case state
        case createdOn
        case sequenceNumber
        case connectedParty
        case links = "_links"
    }
}
