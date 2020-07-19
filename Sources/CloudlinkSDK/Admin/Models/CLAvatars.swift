public class CLAvatars: Codable {
    public var small: String?
    public var medium: String?
    public var large: String?
    public var scaled: String?
    
    enum CodingKeys: String, CodingKey {
        case small = "50"
        case medium = "150"
        case large = "300"
        case scaled
    }
}
