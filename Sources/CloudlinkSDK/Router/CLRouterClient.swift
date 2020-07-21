import Alamofire

public class CLRouterClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://router.dev.api.mitel.io/2018-03-03"
    
    public func getSkills(completion: @escaping (DataResponse<CLHttpResponse<CLSkill>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/skills").responseDecodable(completionHandler: completion)
    }
    
    public func getSkill(skillId: String, completion: @escaping (DataResponse<CLSkill, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/skills/\(skillId)").responseDecodable(completionHandler: completion)
    }
    
    public func createSkill(name: String, completion: @escaping (DataResponse<CLSkill, AFError>) -> Void) {
        let payload = [
            "name": name
        ]
        self.httpClient.session.POST("\(self.baseUrl)/skills", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    public func deleteSkill(skillId: String, completion: @escaping (Result<Empty, AFError>) -> Void) {
        self.httpClient.session.DELETE("\(self.baseUrl)/skills/\(skillId)").response { response in
            switch(response.result) {
            case .success(_):
                completion(.success(Empty.emptyValue()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getInteractions(completion: @escaping (DataResponse<CLHttpResponse<CLInteraction>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/interactions").responseDecodable(completionHandler: completion)
    }
    
    public func getEndpoints(completion: @escaping (DataResponse<CLHttpResponse<CLEndpoint>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/endpoints").responseDecodable(completionHandler: completion)
    }
    
    public func getEndpoint(endpointId: String, completion: @escaping (DataResponse<CLEndpoint, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/endpoints/\(endpointId)").responseDecodable(completionHandler: completion)
    }
    
    public func getChannels(endpointId: String, completion: @escaping (DataResponse<CLHttpResponse<CLChannel>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/endpoints/\(endpointId)/channels").responseDecodable(completionHandler: completion)
    }
    
    public init() {
    }
}
