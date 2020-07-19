public struct CLSkill: Codable {
    public var skillId: String
    public var name: String
    public var createdBy: String
    public var createdOn: String
    public var modifiedBy: String
    public var modifiedOn: String
    public var links: CLHttpResponseLinks
    
    enum CodingKeys: String, CodingKey {
        case skillId
        case name
        case createdBy
        case createdOn
        case modifiedBy
        case modifiedOn
        case links = "_links"
    }
}
