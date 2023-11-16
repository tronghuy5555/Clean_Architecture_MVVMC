//
//  AuthViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol AuthenticationDelegate : AnyObject {
    func checkAuthentication()
}

class AuthViewModel : BaseViewModel {
    weak var authDelegate: AuthenticationDelegate?
   
    override init() {
        super.init()
    }
}


