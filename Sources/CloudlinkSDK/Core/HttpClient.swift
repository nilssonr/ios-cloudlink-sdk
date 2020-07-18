import Alamofire

class CLHttpClient {
    func post<T>(url: String, parameters: [String:String], completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        AF.request(url, method: .post, parameters: parameters).responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func get<T>(url: String, accessToken: String, completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(url, method: .get, headers: [.authorization(bearerToken: accessToken)]).responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
