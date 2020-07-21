import Alamofire

public class CLMediaClient {
    private var httpClient = CLHttpClient()
    private var baseUrl = "https://media.dev.api.mitel.io/2017-09-01"
    
    public func getCalls(completion: @escaping (DataResponse<CLHttpResponse<CLCallHistoryItem>, AFError>) -> Void) {
        self.httpClient.session.GET("\(self.baseUrl)/calls").responseDecodable(completionHandler: completion)
    }
}
