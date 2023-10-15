//
//  UseCase.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 13/10/2023.
//

import Foundation
import RxSwift

protocol UseCase {
        
    func execute(request : USRequest) -> Observable<USResponse>
    
    associatedtype USRequest
    associatedtype USResponse
    

}
