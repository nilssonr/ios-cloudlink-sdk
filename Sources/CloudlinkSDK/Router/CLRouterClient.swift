public class CLRouterClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://router.dev.api.mitel.io/2018-03-03"
    
    public func getSkills(completion: @escaping (Result<CLHttpResponse<CLSkill>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/skills", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLSkill>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getSkill(skillId: String, completion: @escaping (Result<CLSkill, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/skills/\(skillId)", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLSkill, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func createSkill(name: String, completion: @escaping (Result<CLSkill, Error>) -> Void) {
        self.httpClient.post(url: "\(self.baseUrl)/skills", accessToken: ClAuthenticationClient.instance().token.accessToken, parameters: ["name": name]) { (result: Result<CLSkill, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func deleteSkill(skillId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        self.httpClient.delete(url: "\(self.baseUrl)/skills/\(skillId)", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<Bool, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getInteractions(completion: @escaping (Result<CLHttpResponse<CLInteraction>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/interactions", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLInteraction>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
