//
//  BaseViewModel.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

protocol ViewModelProtocol : AnyObject {
    
}

typealias BaseViewModel = BaseViewModelImpl & ViewModelProtocol
class BaseViewModelImpl {
    
    let disposeBag = DisposeBag()
    
}
