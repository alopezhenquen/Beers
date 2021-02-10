
import Foundation
import Alamofire

struct RequestData {
    var url: String
    var method: HTTPMethod
    var encoding: ParameterEncoding
    var parameters: [String: Any]?
}

typealias RequestSuccess<T: Decodable> = (_ result: T?) -> Void
typealias RequestFailure = (_ error: AFError?) -> Void

protocol NetworkManager {
    static func request<T: Decodable>(data: RequestData,
                                      decoder: DefaultDecoder<T>,
                                      success: @escaping RequestSuccess<T>,
                                      failure: @escaping RequestFailure)
}

class AlamofireManager: NetworkManager {
    static func request<T: Decodable>(data: RequestData,
                                      decoder: DefaultDecoder<T>,
                                      success: @escaping RequestSuccess<T>,
                                      failure: @escaping RequestFailure) {
        
        let request = AF.request(
            data.url, method: data.method,
            parameters: data.parameters,
            encoding: data.encoding)
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                let data = response.data ?? Data()
                let decodedData = decoder.decode(from: data)
                success(decodedData)
            case .failure:
                failure(response.error)
            }
        }
    }
}
