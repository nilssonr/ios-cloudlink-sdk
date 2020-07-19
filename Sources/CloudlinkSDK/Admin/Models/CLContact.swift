public struct CLContact : Codable {
    public var createdOn: String
    public var modifiedOn: String
    public var contactId: String
    public var accountId: String
    public var name: String
    public var email: String?
    public var contactType: String
    public var createdBy: String
    public var modifiedBy: String
    public var links: CLHttpResponseLinks?
    
    enum CodingKeys: String, CodingKey {
        case createdOn
        case modifiedOn
        case contactId
        case accountId
        case name
        case email
        case contactType
        case createdBy
        case modifiedBy
        case links = "_links"
    }
}
