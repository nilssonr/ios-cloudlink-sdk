class ClAuthenticationClient {
    
    private static var sharedAuthClient: ClAuthenticationClient = {
        return ClAuthenticationClient()
    }()
    
    private init() {
    }
    
    class func instance() -> ClAuthenticationClient {
        return sharedAuthClient
    }
        
    public var token: CLToken!
    private var httpClient = CLHttpClient()
    
    func getToken(request: CLTokenRequest, completion: @escaping (Result<CLToken, Error>) -> Void) {
        self.httpClient.post(
            url: "https://authentication.dev.api.mitel.io/2017-09-01/token",
            parameters: [
                "account_id": request.accountId,
                "username": request.username,
                "password": request.password,
                "grant_type": request.grantType
            ]
        ) { (result: Result<CLToken, Error>) in
            switch(result) {
            case .success(let data):
                self.token = data
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func whoAmI(completion: @escaping (Result<CLTokenInformation, Error>) -> Void) {
        self.httpClient.get(
            url: "https://authentication.dev.api.mitel.io/2017-09-01/token",
            accessToken: self.token.accessToken
        ) { (result: Result<CLTokenInformation, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
