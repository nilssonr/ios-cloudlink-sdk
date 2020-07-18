struct CLHttpResponse<T> : Codable where T : Codable {
    var count: Int
    var links: CLHttpResponseLinks
    var embedded: CLHttpResponseEmbedded<T>
    
    enum CodingKeys: String, CodingKey {
        case count
        case links = "_links"
        case embedded = "_embedded"
    }
}

struct CLHttpResponseLinks : Codable {
    var self_type: String
    
    enum CodingKeys: String, CodingKey {
        case self_type = "self"
    }
}

struct CLHttpResponseEmbedded<T> : Codable where T : Codable {
    var items: [T]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
