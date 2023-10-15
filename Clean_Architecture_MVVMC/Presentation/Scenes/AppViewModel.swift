//
//  AppViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 15/10/2023.
//

import Foundation

class AppViewModel : BaseViewModel {
    
    var userSessionStatus : GetUserSessionStatusUseCase
    
    init(userSessionStatus: GetUserSessionStatusUseCase) {
        self.userSessionStatus = userSessionStatus
    }
    
}
