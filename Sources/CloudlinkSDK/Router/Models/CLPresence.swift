public class CLPresence: Codable {
    public var enteredOn: String?
    public var status: String
    
    enum CodingKeys: String, CodingKey {
        case enteredOn
        case status
    }
}
