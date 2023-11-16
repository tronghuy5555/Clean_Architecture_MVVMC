//
//  AppCoordinator.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import UIKit
import RxSwift

protocol AppNavigation {
    func navigateToAuthScreen()
    func navigateToBannedViolationScreen()
    func navigateToBannedUnderAgeScreen()
    func navigateToBannedDeactivatedScreen()
    func navigateToBannedUnAuthenticatedScreen()
}

class AppCoordinator : BaseCoordinator {
    let appViewModel: AppViewModel
    
    init(navigationController: UINavigationController, appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
        super.init(navigationController: navigationController)
    }
    
    func start() {
        self.appViewModel.userSessionStatusStream.observe(on: MainScheduler()).subscribe(
            onNext: {[weak self] status in
                switch (status) {
                case .authenticated:
                    self?.navigateToAuthScreen()
                case .banned_violation:
                    self?.navigateToBannedViolationScreen()
                case .banned_under_age:
                    self?.navigateToBannedUnderAgeScreen()
                case .deactived:
                    self?.navigateToBannedDeactivatedScreen()
                case .unauthenticated:
                    self?.navigateToBannedUnAuthenticatedScreen()
                }
            }, onCompleted: {
                
            }).disposed(by: disposeBag)
    }
    
    
}

extension AppCoordinator : AppNavigation {
    func navigateToAuthScreen() {
        var authCoordinator = AuthCoordinator(navigationController: UINavigationController())
        authCoordinator.parentCoordinator = self
        self.navigationController.setViewControllers([authCoordinator.navigationController], animated: true)
    }
    
    func navigateToBannedViolationScreen() {
        
    }
    
    func navigateToBannedUnderAgeScreen() {
        
    }
    
    func navigateToBannedDeactivatedScreen() {
        
    }
    
    func navigateToBannedUnAuthenticatedScreen() {
        
    }
}


extension AppCoordinator : AuthenticationDelegate {
    func checkAuthentication() {
        start()
    }
}


