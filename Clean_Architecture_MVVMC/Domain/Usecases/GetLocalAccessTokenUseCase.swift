//
//  GetLocalAccessTokenUseCase.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

class GetLocalAccessTokenUseCase: UseCase {
    let authRepository: AuthenticationRepository

    typealias USRequest = Void?
    
    typealias USResponse = String
    
    init(authRepository: AuthenticationRepository) {
        self.authRepository = authRepository
    }
    
    func execute(request: Void? = nil) -> Observable<String> {
        return authRepository.getLocalAccessToken().asObservable()
    }
}
