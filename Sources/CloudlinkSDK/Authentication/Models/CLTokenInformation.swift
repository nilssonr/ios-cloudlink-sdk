public struct CLTokenInformation : Codable {
    public var extensionNumber: String
    public var role: String
    public var iss: String
    public var mobileVerified: String
    public var principalId: String
    public var integrationLatency: Int
    public var profileHeaderUrl: String
    public var sipAddress: String
    public var exp: String
    public var iat: String
    public var email: String
    public var phoneVerified: String
    public var mobile: String
    public var languageCode: String
    public var userId: String
    public var uniqueUserId: String
    public var accountId: String
    public var emailVerified: String
    public var phone: String
    public var domain: String
    public var name: String
    public var siteId: String
    public var partnerId: String
    
    enum CodingKeys: String, CodingKey {
        case extensionNumber = "extension"
        case role
        case iss
        case mobileVerified
        case principalId
        case integrationLatency
        case profileHeaderUrl
        case sipAddress
        case exp
        case iat
        case email
        case phoneVerified
        case mobile
        case languageCode
        case userId
        case uniqueUserId
        case accountId
        case emailVerified
        case phone
        case domain
        case name
        case siteId
        case partnerId
    }
}
