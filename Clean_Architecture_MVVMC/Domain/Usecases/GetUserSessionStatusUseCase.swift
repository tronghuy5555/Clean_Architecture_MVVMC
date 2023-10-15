//
//  GetUserSessionStatusUseCase.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

enum UserSessionStatus {
    case authenticated
    case banned_violation
    case banned_under_age
    case deactived
    case unauthenticated
}

class GetUserSessionStatusUseCase: UseCase {
    let authRepository: AuthenticationRepository

    typealias USRequest = Void?
    
    typealias USResponse = UserSessionStatus
    
    init(authRepository: AuthenticationRepository) {
        self.authRepository = authRepository
    }
    
    func execute(request: Void? = nil) -> Observable<UserSessionStatus> {
        return authRepository.getLocalAccessToken().asObservable().map { token in
            return UserSessionStatus.authenticated
        }
    }
}
