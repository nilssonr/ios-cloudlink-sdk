public class CLChannel: Codable {
    public var type: String
    public var max: Int
    public var channelId: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case max
        case channelId
    }
}
