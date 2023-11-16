//
//  APIDataSource.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 15/10/2023.
//

import Foundation
import RxSwift
import Alamofire

protocol APIDataSource {
    func request<T:Codable>(url: String, method: HTTPMethod, parameters: Parameters?) -> Single<AppResponse<T>>
}
extension APIDataSource {
    func simpleRequest<T:Codable>(url: String) -> Single<AppResponse<T>> {
        return request(url: url, method: .get, parameters: nil)
    }
    
    func requestWithoutParam<T:Codable>(url: String, method: HTTPMethod) -> Single<AppResponse<T>> {
        return request(url: url, method: method, parameters: nil)
    }
}

class APIDataSourceImpl : APIDataSource {
    private let apiQueue = DispatchQueue(label: "api.datasource.queue", qos: .utility, attributes: .concurrent)
    
    static let shared = APIDataSourceImpl()
    private init() {}
    
    func request<T:Codable>(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil) -> Single<AppResponse<T>> {
        return Single<AppResponse<T>>.create {[weak self] single in
            self?.apiQueue.async {
                AF.request(url,
                           method: method,
                           parameters: parameters,
                           interceptor: Interceptor()
                ).response { response in
                    if (response.response?.statusCode == 200) {
                        let decoder = JSONDecoder()
                        guard let data = response.data,
                              let jsonData = try? decoder.decode(T.self, from: data) else {
                            return
                        }
                        single(.success(AppResponse(value: jsonData)))
                    } else {
                        single(.failure(AppError(error: response.error)))
                    }
                }
            }
            
            return Disposables.create {
            }
        }
    }
}

struct AppResponse<T:Codable> {
    let value: T
}

struct AppError: Error {
    let error: Error?
    var debugMessage: String? = nil
    var debugData: Any? = nil
}
