public class CLEndpoint: Codable {
    public var presences: CLEndpointPresences
    public var endpointId: String
    public var createdBy: String
    public var createdOn: String
    public var modifiedBy: String
    
    enum CodingKeys: String, CodingKey {
        case presences
        case endpointId
        case createdBy
        case createdOn
        case modifiedBy
    }
}
