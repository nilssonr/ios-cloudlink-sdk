import Alamofire

public class CLRouterClient {
    private var httpClient = CLHttpClient()
    private var useDev = false
    
    // MARK: Skill Groups
    
    public func getSkillGroups(completion: @escaping (DataResponse<CLHttpResponse<CLSkillGroup>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/skillgroups").responseDecodable(completionHandler: completion)
    }
    
    public func getSkillGroup(skillGroupId: String, completion: @escaping (DataResponse<CLSkillGroup, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/skillgroups/\(skillGroupId)").responseDecodable(completionHandler: completion)
    }
    
    public func createSkillGroup(name: String, skillIds: [String], completion: @escaping (DataResponse<CLSkillGroup, AFError>) -> Void) {
        let payload = CLSkillGroup(name: name, skills: skillIds)
        self.httpClient.session.POST("\(self.getBaseUrl())/skillgroups", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    public func updateSkillGroup(skillGroupId: String, skillIds: [String], completion: @escaping (DataResponse<CLSkillGroup, AFError>) -> Void) {
        let payload = CLSkillGroup(skillGroupId: skillGroupId, skills: skillIds)
        self.httpClient.session.PUT("\(self.getBaseUrl())/skillgroups/\(skillGroupId)", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    public func deleteSkillGroup(skillGroupId: String, completion: @escaping (Result<Empty, AFError>) -> Void) {
        self.httpClient.session.DELETE("\(self.getBaseUrl())/skillsgroups/\(skillGroupId)").response { response in
            switch(response.result) {
            case .success(_):
                completion(.success(Empty.emptyValue()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: Skills
    
    public func getSkills(completion: @escaping (DataResponse<CLHttpResponse<CLSkill>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/skills").responseDecodable(completionHandler: completion)
    }
    
    public func getSkill(skillId: String, completion: @escaping (DataResponse<CLSkill, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/skills/\(skillId)").responseDecodable(completionHandler: completion)
    }
    
    public func createSkill(name: String, completion: @escaping (DataResponse<CLSkill, AFError>) -> Void) {
        let payload = [
            "name": name
        ]
        self.httpClient.session.POST("\(self.getBaseUrl())/skills", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    public func deleteSkill(skillId: String, completion: @escaping (Result<Empty, AFError>) -> Void) {
        self.httpClient.session.DELETE("\(self.getBaseUrl())/skills/\(skillId)").response { response in
            switch(response.result) {
            case .success(_):
                completion(.success(Empty.emptyValue()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func updateSkill(skillId: String, name: String, completion: @escaping (DataResponse<CLSkill, AFError>) -> Void) {
        let payload = CLSkill(skillId: skillId, name: name)
        self.httpClient.session.PUT("\(self.getBaseUrl())/skills/\(skillId)", payload: payload).responseDecodable(completionHandler: completion)
    }
    
    // MARK: Interactions
    
    public func getInteractions(completion: @escaping (DataResponse<CLHttpResponse<CLInteraction>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/interactions").responseDecodable(completionHandler: completion)
    }
    
    public func getEndpoints(completion: @escaping (DataResponse<CLHttpResponse<CLEndpoint>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/endpoints").responseDecodable(completionHandler: completion)
    }
    
    public func getEndpoint(endpointId: String, completion: @escaping (DataResponse<CLEndpoint, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/endpoints/\(endpointId)").responseDecodable(completionHandler: completion)
    }
    
    public func getChannels(endpointId: String, completion: @escaping (DataResponse<CLHttpResponse<CLChannel>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.getBaseUrl())/endpoints/\(endpointId)/channels").responseDecodable(completionHandler: completion)
    }
    
    // MARK: General
    
    private func getBaseUrl() -> String {
        return self.useDev ? "https://router.api.mitel.io/2018-03-03" : "https://router.dev.api.mitel.io/2018-03-03"
    }
    
    public init() {
    }
    
    public init(useDev: Bool) {
        self.useDev = useDev
    }
}
