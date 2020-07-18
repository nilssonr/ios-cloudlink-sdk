struct CLContact : Codable {
    var createdOn: String
    var modifiedOn: String
    var contactId: String
    var accountId: String
    var name: String
    var email: String
    var contactType: String
    var createdBy: String
    var modifiedBy: String
    
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
    }
}
