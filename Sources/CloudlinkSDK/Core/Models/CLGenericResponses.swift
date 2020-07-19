public struct CLHttpResponse<T>: Codable where T: Codable {
    public var count: Int
    public var links: CLHttpResponseLinks
    public var embedded: CLHttpResponseEmbedded<T>
    
    enum CodingKeys: String, CodingKey {
        case count
        case links = "_links"
        case embedded = "_embedded"
    }
}

public struct CLHttpResponseLinks: Codable {
    public var selfUrl: String
    public var reference: String?
    public var next: String?
    
    enum CodingKeys: String, CodingKey {
        case selfUrl = "self"
        case reference
        case next
    }
}

public struct CLHttpResponseEmbedded<T>: Codable where T: Codable {
    public var items: [T]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
