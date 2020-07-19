public struct CLInteraction: Codable {
    public var interactionId: String
    public var skillGroupId: String
    public var state: String
    public var channelType: String
    public var priority: String
    public var timeOfferedToSystem: String
    public var timeOfferedToSkillGroup: String
    public var timeOfferedToEndpoint: String
    public var handlingChannelId: String
    public var handlingEndpointId: String
    public var createdBy: String
    public var createdOn: String
    public var modifiedBy: String
    public var links: CLHttpResponseLinks
    
    enum CodingKeys: String, CodingKey {
        case interactionId
        case skillGroupId
        case state
        case channelType
        case priority
        case timeOfferedToSystem
        case timeOfferedToSkillGroup
        case timeOfferedToEndpoint
        case handlingChannelId
        case handlingEndpointId
        case createdBy
        case createdOn
        case modifiedBy
        case links = "_links"
    }
}
