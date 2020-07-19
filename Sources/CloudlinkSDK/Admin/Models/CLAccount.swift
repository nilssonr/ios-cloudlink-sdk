public struct CLAccount: Codable {
    public var accountId: String
    public var accessTokenExpiryHours: Int
    public var refreshTokenExpiryHours: Int
    public var userLimit: Int
    public var createdOn: String
    public var modifiedOn: String
    public var accountNumber: String
    public var active: Bool
    public var createdBy: String
    public var domain: String
    public var languageCode: String
    public var links: CLHttpResponseLinks
    public var location: CLLocation
    public var modifiedBy: String
    public var name: String
    public var partnerId: String
    public var policy: CLPolicy
    public var policyId: String
    public var source: String
    public var state: String
    public var topLevelDomain: [String]
    public var contacts: [CLContact]
    
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
