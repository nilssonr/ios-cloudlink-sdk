class CLRouterClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://router.dev.api.mitel.io/2018-03-03"
    
    func getSkills(completion: @escaping (Result<CLHttpResponse<[CLSkill]>, Error>) -> Void) {
        self.httpClient.get(
            url: "\(self.baseUrl)/skills",
            accessToken: ClAuthenticationClient.instance().token.accessToken
        ) { (result: Result<CLHttpResponse<[CLSkill]>, Error>) in
            
            switch(result) {
            case .success(let data):
                debugPrint(data)
                completion(.success(data))
            case .failure(let error):
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
}
