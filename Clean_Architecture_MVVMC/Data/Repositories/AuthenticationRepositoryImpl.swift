//
//  AuthenticationRepositoryImpl.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

class AuthenticationRepositoryImpl : AuthenticationRepository {
    let apiDataSource: APIDataSource
    
    init(apiDataSource: APIDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    func getProfile(isLocal: Bool) -> Single<ProfileEntity> {
        return apiDataSource.simpleRequest(url: "/profile").map{ $0.value}
    }
    
    
    func login(userName: String, password: String) -> Single<ProfileEntity> {
        let parameters: [String: Any] = [
            "username": userName,
            "password": password
        ]
        return apiDataSource.request(url: "/login", method: .post, parameters: parameters
        ).map{ $0.value}

    }
    
    func getLocalAccessToken() -> Single<String> {
        return apiDataSource.simpleRequest(url: "/token").map{ $0.value}
    }
}
