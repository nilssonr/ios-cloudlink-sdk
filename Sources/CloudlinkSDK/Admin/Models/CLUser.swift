public class CLUser: Codable {
    public var createdOn: String?
    public var modifiedOn: String?
    public var accountId: String?
    public var uniqueUserId: String?
    public var name: String?
    public var userId: String?
    public var email: String?
    public var role: String?
    public var emailValid: Bool?
    public var emailVerified: Bool?
    public var extensionNumber: String?
    public var siteId: String?
    public var extensionVerified: Bool?
    public var mobileVerified: Bool?
    public var displayName: String?
    public var source: String?
    public var phoneVerified: Bool?
    public var sipAddress: String?
    public var userVerified: Bool?
    public var createdBy: String?
    public var links: CLHttpResponseLinks?
    public var sipPassword: String?
    public var mobile: String?
    public var phone: String?
    public var photoUrl: String?
    public var avatars: CLAvatars?
    public var modifiedBy: String?
    
    enum CodingKeys: String, CodingKey {
        case createdOn
        case modifiedOn
        case accountId
        case uniqueUserId
        case name
        case userId
        case email
        case role
        case emailValid
        case emailVerified
        case siteId
        case extensionVerified
        case mobileVerified
        case displayName
        case source
        case phoneVerified
        case sipAddress
        case userVerified
        case createdBy
        case links = "_links"
        case sipPassword
        case extensionNumber = "extension"
        case mobile
        case phone
        case photoUrl
        case avatars
        case modifiedBy
    }
    
    public init() {}
}
