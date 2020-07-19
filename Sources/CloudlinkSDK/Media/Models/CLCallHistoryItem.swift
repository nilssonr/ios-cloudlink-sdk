public struct CLCallHistoryItem : Codable {
    public var callId: String
    public var accountId: String
    public var siteId: String
    public var userId: String
    public var direction: String
    public var from: String
    public var to: String
    public var state: String
    public var createdOn: String
    public var sequenceNumber: String
    public var connectedParty: CLConnectedParty
    public var links: CLHttpResponseLinks
 
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
