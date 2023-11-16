//
//  AppViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 15/10/2023.
//

import Foundation
import RxSwift

class AppViewModel : BaseViewModel {
    
    var userSessionStatus : GetUserSessionStatusUseCase
    let userSessionStatusStream = PublishSubject<UserSessionStatus>()
    
    init(userSessionStatus: GetUserSessionStatusUseCase) {
        self.userSessionStatus = userSessionStatus
    }
    
    func startToFetchStatus() {
        self.userSessionStatus.execute().subscribe(onNext: {[weak self] status in
            self?.userSessionStatusStream.onNext(status)
        }).disposed(by: disposeBag)
    }
}
