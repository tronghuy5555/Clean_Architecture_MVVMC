//
//  LoginViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

class LoginViewModel: BaseViewModel {
    let loginUseCase: any LoginUserUseCaseProtocol
    weak var authNavigation: AuthNavigationDelegate?
    
    let loginResult:PublishSubject = PublishSubject<ProfileEntity>()
    let userNameValidationError: PublishSubject = PublishSubject<Bool>()
    let passwordValidationError: PublishSubject = PublishSubject<Bool>()
    
    var isEnableSubmitButton: Observable<Bool> {
        return Observable.combineLatest(userNameValidationError, passwordValidationError).map { (username, password) in
            return username && password
        }
    }
    
    init(loginUseCase: any LoginUserUseCaseProtocol) {
        self.loginUseCase = loginUseCase
    }
    
    func submitLogin(userName: String, password: String) {
        showLoading()
        loginUseCase.execute(request: LoginUserRequest(userName: userName, password: password)).subscribe (onNext: {[weak self] profile in
            self?.loginResult.onNext(profile)
            self?.hideLoading()
        }, onError: {[weak self] error in
            self?.loginResult.onError(error)
            self?.hideLoading()
        }).disposed(by: disposeBag)
    }
    
    func validatedUsername(_ username: String?) {
        guard let username = username else {
            userNameValidationError.on(.next(false))
            return
        }
        if (username.count > 6) {
            userNameValidationError.on(.next(true))
        } else {
            userNameValidationError.on(.next(false))
        }
    }
    
    func validatePassword(_ password: String?) {
        guard let password = password else {
            passwordValidationError.on(.next(false))
            return
        }
        if (password.count > 6) {
            passwordValidationError.on(.next(true))
        } else {
            passwordValidationError.on(.next(false))
        }
    }
}
