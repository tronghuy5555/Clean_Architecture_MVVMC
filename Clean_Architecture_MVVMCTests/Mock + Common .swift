//
//  Typelias + Common.swift
//  Clean_Architecture_MVVMCTests
//
//  Created by Huy Pham on 16/10/2023.
//

import Foundation
import RxSwift

protocol UseCaseMock : UseCase {
    var executeCompleteCount: Int {get set}
    var mockDelegate: UseCaseExecutionDelegate<USRequest, USResponse> {get set}
}

extension ProfileEntity {
    static func toStub() -> ProfileEntity {
        return ProfileEntity()
    }
}


