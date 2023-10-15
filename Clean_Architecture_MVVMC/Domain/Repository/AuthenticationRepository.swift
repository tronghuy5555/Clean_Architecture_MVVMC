//
//  AuthenticationRepository.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

protocol AuthenticationRepository {
    func login(userName: String, password: String) -> Single<ProfileEntity>
    func getLocalAccessToken() -> Single<String>
    func getProfile(isLocal: Bool) -> Single<ProfileEntity>
}
