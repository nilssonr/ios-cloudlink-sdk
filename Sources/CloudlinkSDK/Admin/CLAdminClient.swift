public class CLAdminClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://admin.dev.api.mitel.io/2017-09-01"
    
    public func getAccount(accountId: String, completion: @escaping (Result<CLAccount, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLAccount, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getContacts(accountId: String, completion: @escaping (Result<CLHttpResponse<CLContact>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)/contacts", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLContact>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getContact(accountId: String, contactId: String, completion: @escaping (Result<CLContact, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)/contacts/\(contactId)", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLContact, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getUsers(completion: @escaping (Result<CLHttpResponse<CLUser>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/users", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLUser>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getUser(userId: String, completion: @escaping (Result<CLUser, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/users/\(userId)", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLUser, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getUserTag(userId: String, tagId: String, completion: @escaping (Result<CLTagBase, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/users/\(userId)/tags/\(tagId)", accessToken: CLAuthenticationClient.instance().token.accessToken) { (result: Result<CLTagBase, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public init() {
    }
}
