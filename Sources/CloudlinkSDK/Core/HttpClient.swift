import Alamofire
import Foundation

class CLHttpClient {
    func post<T>(url: String, accessToken: String, parameters: [String:String], contentType: String = "application/json", completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [.authorization(bearerToken: accessToken), .contentType(contentType), .accept("application/json")]).validate().responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func post<T>(url: String, parameters: [String:String], completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        AF.request(url, method: .post, parameters: parameters, headers: [.accept("application/json")]).validate().responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func get<T>(url: String, accessToken: String, completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        AF.request(url, method: .get, headers: [.authorization(bearerToken: accessToken), .accept("application/json"), .accept("application/json")]).validate().responseDecodable(of: T.self) { response in
            switch(response.result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func delete(url: String, accessToken: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        AF.request(url, method: .delete, headers: [.authorization(bearerToken: accessToken), .accept("application/json"), .accept("application/json")]).validate().response { response in
            if response.error == nil {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        }
    }
}
