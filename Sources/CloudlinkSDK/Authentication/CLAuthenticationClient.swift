import Alamofire

public class CLAuthenticationClient {
    private static var sharedAuthClient: CLAuthenticationClient = {
        return CLAuthenticationClient()
    }()
    
    private init() {
    }
    
    public class func instance() -> CLAuthenticationClient {
        return sharedAuthClient
    }
        
    public var token: CLToken?
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://authentication.dev.api.mitel.io/2017-09-01"
    
    public func getToken(request: CLTokenRequest, completion: @escaping (Result<CLToken, Error>) -> Void) {
        let payload = [
            "account_id": request.accountId,
            "username": request.username,
            "password": request.password,
            "grant_type": request.grantType
        ]
        self.httpClient.session.POST("\(self.baseUrl)/token", payload: payload).responseDecodable(of: CLToken.self) { response in
            switch(response.result) {
            case .success(let data):
                self.token = data
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getRefreshToken(completion: @escaping (DataResponse<CLToken, AFError>) -> Void) {
        let payload = [
            "grant_type": "refresh_token",
            "token": CLAuthenticationClient.instance().token!.refreshToken
        ]
        self.httpClient.session.POST("\(self.baseUrl)/token", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    public func whoAmI(completion: @escaping (DataResponse<CLTokenInformation, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/token").responseDecodable(completionHandler: completion)
    }
}
