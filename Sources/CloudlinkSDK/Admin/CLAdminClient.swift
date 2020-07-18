class CLAdminClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://admin.dev.api.mitel.io/2017-09-01"
    
    func getAccount(accountId: String, completion: @escaping (Result<CLAccount, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLAccount, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getContacts(accountId: String, completion: @escaping (Result<CLHttpResponse<CLContact>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)/contacts", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLContact>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getContact(accountId: String, contactId: String, completion: @escaping (Result<CLContact, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/accounts/\(accountId)/contacts/\(contactId)", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLContact, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
