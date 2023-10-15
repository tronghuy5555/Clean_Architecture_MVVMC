//
//  AuthCoordinator.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import UIKit

protocol AuthNavigationDelegate: AnyObject {
    func navigateToLogin()
    func navigateForgotPassword()
    func navigateRegister()
}

class AuthCoordinator : BaseCoordinator {
    
    init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    func start() {
        
    }
}


extension AuthCoordinator: AuthNavigationDelegate {
    
    func navigateToLogin() {
        
    }
    
    func navigateForgotPassword() {
        
    }
    
    func navigateRegister() {
        
    }
    
}
