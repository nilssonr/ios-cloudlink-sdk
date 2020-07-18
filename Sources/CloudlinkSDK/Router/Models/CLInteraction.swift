struct CLInteraction : Codable {
    var interactionId: String
    var skillGroupId: String
    var state: String
    var channelType: String
    var priority: String
    var timeOfferedToSystem: String
    var timeOfferedToSkillGroup: String
    var timeOfferedToEndpoint: String
    var handlingChannelId: String
    var handlingEndpointId: String
    var createdBy: String
    var createdOn: String
    var modifiedBy: String
    var links: CLHttpResponseLinks
    
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
