//
//  BaseViewController.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import UIKit
import RxSwift

protocol ViewControllerProtocol : AnyObject {
    
}

typealias BaseViewController = BaseViewControllerImpl & ViewControllerProtocol
class BaseViewControllerImpl: UIViewController {
    
    let disposeBag = DisposeBag()
}

