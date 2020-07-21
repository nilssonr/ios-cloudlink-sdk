import Alamofire

public class CLAdminClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://admin.dev.api.mitel.io/2017-09-01"
    
    public func getAccount(accountId: String, completion: @escaping (DataResponse<CLAccount, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/accounts/\(accountId)").responseDecodable(completionHandler: completion)
    }
    
    public func getContacts(accountId: String, completion: @escaping (DataResponse<CLHttpResponse<CLContact>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/accounts/\(accountId)/contacts").responseDecodable(completionHandler: completion)
    }
    
    public func getContact(accountId: String, contactId: String, completion: @escaping (DataResponse<CLContact, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/accounts/\(accountId)/contacts/\(contactId)").responseDecodable(completionHandler: completion)
    }
    
    public func getUsers(completion: @escaping (DataResponse<CLHttpResponse<CLUser>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/users").responseDecodable(completionHandler: completion)
    }
    
    public func getUser(userId: String, completion: @escaping (DataResponse<CLUser, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/users/\(userId)").responseDecodable(completionHandler: completion)
    }
    
    public func getUserTag(userId: String, tagId: String, completion: @escaping (DataResponse<CLTagBase, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/users/\(userId)/tags/\(tagId)").responseDecodable(completionHandler: completion)
    }

    public init() {
    }
}
