//
//  LoginViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

class LoginViewModel: BaseViewModel {
    let loginUseCase: LoginUserUseCase
    weak var authNavigation: AuthNavigationDelegate?
    
    init(loginUseCase: LoginUserUseCase) {
        self.loginUseCase = loginUseCase
    }
}
