//
//  File.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

struct LoginUserRequest {
    var userName: String
    var password: String
}

class LoginUserUseCase : UseCase {
  
    let authRepository: AuthenticationRepository
    
    init(authRepository: AuthenticationRepository) {
        self.authRepository = authRepository
    }
    
    typealias USRequest = LoginUserRequest
    
    typealias USResponse = ProfileEntity
    
    func execute(request: LoginUserRequest) -> Observable<ProfileEntity> {
        return authRepository.login(userName: request.userName, password: request.password).asObservable()
    }
}
