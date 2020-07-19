public struct CLHttpResponse<T> : Codable where T : Codable {
    var count: Int
    var links: CLHttpResponseLinks
    var embedded: CLHttpResponseEmbedded<T>
    
    enum CodingKeys: String, CodingKey {
        case count
        case links = "_links"
        case embedded = "_embedded"
    }
}

public struct CLHttpResponseLinks : Codable {
    var self_type: String
    var reference: String?
    var next: String?
    
    enum CodingKeys: String, CodingKey {
        case self_type = "self"
        case reference
        case next
    }
}

public struct CLHttpResponseEmbedded<T> : Codable where T : Codable {
    var items: [T]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
