struct CLAccount : Codable {
    var accountId: String
    var accessTokenExpiryHours: Int
    var refreshTokenExpiryHours: Int
    var userLimit: Int
    var createdOn: String
    var modifiedOn: String
    var accountNumber: String
    var active: Bool
    var createdBy: String
    var domain: String
    var languageCode: String
    var links: CLHttpResponseLinks
    var location: CLLocation
    var modifiedBy: String
    var name: String
    var partnerId: String
    var policy: CLPolicy
    var policyId: String
    var source: String
    var state: String
    var topLevelDomain: [String]
    var contacts: [CLContact]
    
    enum CodingKeys: String, CodingKey {
        case accountId
        case accessTokenExpiryHours
        case refreshTokenExpiryHours
        case userLimit
        case createdOn
        case modifiedOn
        case accountNumber
        case active
        case createdBy
        case domain
        case languageCode
        case links = "_links"
        case location
        case modifiedBy
        case name
        case partnerId
        case policy
        case policyId
        case source
        case state
        case topLevelDomain
        case contacts
    }
}
