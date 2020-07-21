public class CLSkillGroup: Codable {
    public var skillGroupId: String
    public var name: String
    public var skills: [String]
    public var createdBy: String
    public var createdOn: String
    public var modifiedBy: String
    public var modifiedOn: String
    public var links: CLHttpResponseLinks
    
    enum CodingKeys: String, CodingKey {
        case skillGroupId
        case name
        case skills
        case createdBy
        case createdOn
        case modifiedBy
        case modifiedOn
        case links = "_links"
    }
}
