//
//  BaseViewController.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol ViewControllerProtocol : AnyObject {
    
}

typealias BaseViewController = BaseViewControllerImpl & ViewControllerProtocol
class BaseViewControllerImpl: UIViewController {
    
    let disposeBag = DisposeBag()
    
    func bindLoadingOverlay(_ loadingDialogResult: Observable<Bool>?) {
        loadingDialogResult?.asDriver(onErrorJustReturn: false).drive(
            onNext: { isShow in
                print("Show loading overlay: \(isShow)")
            }).disposed(by: disposeBag)
    }
}

