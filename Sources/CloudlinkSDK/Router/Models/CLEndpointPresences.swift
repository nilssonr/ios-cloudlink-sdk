public class CLEndpointPresences: Codable {
    var principal: CLPresence
    var aggregate: CLPresence
    
    enum CodingKeys: String, CodingKey {
        case principal
        case aggregate
    }
}
