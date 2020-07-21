import Alamofire
import Foundation

extension Alamofire.Session {
  func GET(_ url: URLConvertible, query: [String: String] = [:]) -> DataRequest {
    return sendQueryParameters(
      url,
      method: .get,
      queryItems: query)
  }
  
  func POST<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
    return sendPayload(url, method: .post, payload: payload)
  }
  
  func PUT<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
    return sendPayload(url, method: .put, payload: payload)
  }
  
  func PATCH<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
    return sendPayload(url, method: .patch, payload: payload)
  }
  
  func DELETE(_ url: URLConvertible, query: [String: String] = [:]) -> DataRequest {
    return sendQueryParameters(
      url,
      method: .delete,
      queryItems: query)
  }
}

private extension Alamofire.Session {
  private func sendPayload<T: Encodable>(_ url: URLConvertible, method: HTTPMethod, payload: T) -> DataRequest {
    return request(
      url,
      method: method,
      parameters: payload,
      encoder: JSONParameterEncoder.default
    ).validate()
  }
  
  private func sendQueryParameters(_ url: URLConvertible, method: HTTPMethod, queryItems: [String: String]) -> DataRequest {
    return request(
      url,
      method: method,
      parameters: queryItems,
      encoder: URLEncodedFormParameterEncoder.default)
  }
}

final class AuthInterceptor: Alamofire.RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let _ = CLAuthenticationClient.instance().token else {
            return completion(.success(urlRequest))
        }

        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + CLAuthenticationClient.instance().token!.accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }

//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
//            /// The request did not fail due to a 401 Unauthorized response.
//            /// Return the original error and don't retry the request.
//            return completion(.doNotRetryWithError(error))
//        }
//
//        refreshToken { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let token):
//                self.storage.accessToken = token
//                /// After updating the token we can safely retry the original request.
//                completion(.retry)
//            case .failure(let error):
//                completion(.doNotRetryWithError(error))
//            }
//        }
//    }
}

class CLHttpClient {
    var session: Session
    
    init() {
        let interceptor = AuthInterceptor()
        session = Session(configuration: .ephemeral, interceptor: interceptor)
    }
}
