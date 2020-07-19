public struct CLTokenInformation : Codable {
    var extensionNumber: String
    var role: String
    var iss: String
    var mobileVerified: String
    var principalId: String
    var integrationLatency: Int
    var profileHeaderUrl: String
    var sipAddress: String
    var exp: String
    var iat: String
    var email: String
    var phoneVerified: String
    var mobile: String
    var languageCode: String
    var userId: String
    var uniqueUserId: String
    var accountId: String
    var emailVerified: String
    var phone: String
    var domain: String
    public var name: String
    var siteId: String
    var partnerId: String
    
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
