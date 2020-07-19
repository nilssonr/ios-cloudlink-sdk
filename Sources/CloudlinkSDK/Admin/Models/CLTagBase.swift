public class CLTagBase: Codable {
    public var links: CLHttpResponseLinks
    
    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}
