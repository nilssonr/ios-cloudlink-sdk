public class ClAuthenticationClient {
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
    private var baseUrl = "https://authentication.dev.api.mitel.io/2017-09-01"
    
    public func getToken(request: CLTokenRequest, completion: @escaping (Result<CLToken, Error>) -> Void) {
        self.httpClient.post(
            url: "\(self.baseUrl)/token",
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
    
    public func getRefreshToken(completion: @escaping (Result<CLToken, Error>) -> Void) {
        self.httpClient.post(
            url: "\(self.baseUrl)/token",
            parameters: [
                "grant_type": "refresh_token",
                "token": ClAuthenticationClient.instance().token.refreshToken
            ]
        ){ (result: Result<CLToken, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func whoAmI(completion: @escaping (Result<CLTokenInformation, Error>) -> Void) {
        self.httpClient.get(
            url: "\(self.baseUrl)/token",
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
