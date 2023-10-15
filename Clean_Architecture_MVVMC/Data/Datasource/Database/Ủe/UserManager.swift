//
//  UserManager.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation


protocol UserManager {
    
}

class UserManagerImpl : UserManager {
    
    private let shared = UserManagerImpl()
    private init() {}
}
