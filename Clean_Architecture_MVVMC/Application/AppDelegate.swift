//
//  AppDelegate.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 12/10/2023.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate {
    static var shared : AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}


let appModule = Container() { container in
    
    container.registerGetUserSessionStatusUseCase { resolver in
        GetUserSessionStatusUseCase(authRepository: resolver.resolveAuthenticationRepositoryImpl())
    }
    container.registerAuthenticationRepositoryImpl { resolver in
        AuthenticationRepositoryImpl(apiDataSource: APIDataSourceImpl.shared)
    }
    
    container.registerLoginUserUseCase { resolver in
        LoginUserUseCase(authRepository: resolver.resolveAuthenticationRepositoryImpl())
    }
    
    container.registerAppViewModel { resolver in
        AppViewModel(userSessionStatus: resolver.resolveGetUserSessionStatusUseCase())
    }
    
    container.registerLoginViewModel { resolver in
        LoginViewModel(loginUseCase: resolver.resolveLoginUserUseCase())
    }
    
    
}



