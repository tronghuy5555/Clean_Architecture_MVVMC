//
//  Coordinator.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import UIKit
import RxSwift

protocol CoordinatorProtocol: AnyObject {
    func start()
}

protocol CoordinatorFlowDelegate: AnyObject {
    func coordinatorEnd(coordinator : BaseCoordinator)
}


typealias BaseCoordinator = BaseCoordinatorImpl & CoordinatorProtocol

class BaseCoordinatorImpl : NSObject {
    
    weak var parentCoordinator: BaseCoordinator?
    weak var coordinatorFlowDelegate: CoordinatorFlowDelegate?
    
    var childrenCoordinator : Array<BaseCoordinator> = []
    let navigationController: UINavigationController
    let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController, parentCoordinator: BaseCoordinator? = nil, coordinatorFlowDelegate: CoordinatorFlowDelegate? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.coordinatorFlowDelegate = coordinatorFlowDelegate
        super.init()
        self.navigationController.delegate = self
    }
    
    func pushNewCoordinator(new coordinator: BaseCoordinator) {
        if (!childrenCoordinator.contains(where: { element in
            return element == coordinator
        })) {
            childrenCoordinator.append(coordinator)
        }
    }
    
    func popCoordinator() -> BaseCoordinator? {
        return childrenCoordinator.popLast()
    }
    
    fileprivate func removeCoordinator(coordinator: BaseCoordinator) {
        childrenCoordinator.removeAll { element in
            return element == coordinator
        }
    }
    
}

extension BaseCoordinatorImpl : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if (navigationController.viewControllers.isEmpty) {
            coordinatorFlowDelegate?.coordinatorEnd(coordinator: self as! BaseCoordinator)
        }
    }
    
}

extension BaseCoordinatorImpl : CoordinatorFlowDelegate {
    
    func coordinatorEnd(coordinator: BaseCoordinator) {
        navigationController.popViewController(animated: true)
        removeCoordinator(coordinator: coordinator)
    }
}
