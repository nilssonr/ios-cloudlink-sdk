public struct CLSkill : Codable {
    var skillId: String
    var name: String
    var createdBy: String
    var createdOn: String
    var modifiedBy: String
    var modifiedOn: String
    var links: CLHttpResponseLinks
    
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
