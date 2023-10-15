//
//  AuthViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation

protocol AuthenticationDelegate : AnyObject {
    func checkAuthentication()
}

class AuthViewModel : BaseViewModel {
    
    let getUserSessionStatusUseCase: GetUserSessionStatusUseCase
    weak var authDelegate: AuthenticationDelegate?
    
    init(getUserSessionStatusUseCase: GetUserSessionStatusUseCase) {
        self.getUserSessionStatusUseCase = getUserSessionStatusUseCase
        super.init()
    }
    
}
