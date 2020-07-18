class CLMediaClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://media.dev.api.mitel.io/2017-09-01"
    
    func getCalls(completion: @escaping (Result<CLHttpResponse<CLCallHistoryItem>, Error>) -> Void) {
        self.httpClient.get(url: "\(self.baseUrl)/calls", accessToken: ClAuthenticationClient.instance().token.accessToken) { (result: Result<CLHttpResponse<CLCallHistoryItem>, Error>) in
            switch(result) {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
