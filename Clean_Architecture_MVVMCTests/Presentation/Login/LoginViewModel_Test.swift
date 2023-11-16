//
//  LoginViewModel_Test.swift
//  Clean_Architecture_MVVMCTests
//
//  Created by Huy Pham on 16/10/2023.
//

import Foundation
import XCTest
import RxSwift
import RxTest
import RxBlocking

@testable import Clean_Architecture_MVVMC
final class LoginViewModel_Tests: XCTestCase {
    let disposeBag = DisposeBag()

    class LoginUserUseCaseMock : LoginUserUseCaseProtocol  {
        var mockDelegate: UseCaseExecutionDelegate<LoginUserRequest, ProfileEntity>
        var executeCompleteCount: Int = 0

        init(mockDelegate: @escaping UseCaseExecutionDelegate<LoginUserRequest, ProfileEntity>) {
            self.mockDelegate = mockDelegate
        }
        func execute(request: LoginUserRequest) -> Observable<ProfileEntity> {
            executeCompleteCount += 1
            return mockDelegate(request)
        }
    }
    override class func setUp() {
        
    }
    
    override class func tearDown() {
        
    }

    func testSubmitLoginSuccessfully_WhenValidInfo() {
        let loginUseCase = LoginUserUseCaseMock(mockDelegate: { request in
            return Observable.create { observable in
                
                observable.onNext(ProfileEntity.toStub())
                return Disposables.create {
                    
                }
            }
        })
        let scheduler = TestScheduler(initialClock: 0)
        let loginResult = scheduler.createObserver(ProfileEntity.self)
        let loadingResult = scheduler.createObserver(Bool.self)

        let profileStub = ProfileEntity.toStub()
    
        var loginViewModel = LoginViewModel(loginUseCase: loginUseCase)
        
        loginViewModel.loginResult.subscribe(loginResult).disposed(by: disposeBag)
        loginViewModel.loadingOverlayResult.subscribe(loadingResult).disposed(by: disposeBag)

        scheduler.createColdObservable([.next(10, ("123456789", "123456789"))])
            .subscribe(
                onNext: { (username, password) in
                    loginViewModel.submitLogin(userName: username, password: password)
            }).disposed(by: disposeBag)
        scheduler.start()
        XCTAssertEqual(loginResult.events, [.next(10, profileStub)])
        XCTAssertEqual(loadingResult.events, [.next(10, true), .next(10, false)])
    }
    
    func testSubmitLoginFailed_WhenValidInfo() {
        struct LoginFailError : Error {
            
        }
        let loginError = LoginFailError()
        let loginUseCase = LoginUserUseCaseMock(mockDelegate: { request in
            return Observable.create { observable in
                observable.onError(LoginFailError())
                return Disposables.create {
                    
                }
            }
        })
        let scheduler = TestScheduler(initialClock: 0)
        let loginResult = scheduler.createObserver(ProfileEntity.self)
        let loadingResult = scheduler.createObserver(Bool.self)
        var loginViewModel = LoginViewModel(loginUseCase: loginUseCase)
        
        loginViewModel.loginResult.subscribe(loginResult).disposed(by: disposeBag)
        loginViewModel.loadingOverlayResult.subscribe(loadingResult).disposed(by: disposeBag)
        
        scheduler.createColdObservable([.next(10, ("error", "error123"))])
            .subscribe(
                onNext: { (username, password) in
                    loginViewModel.submitLogin(userName: username, password: password)
            }).disposed(by: disposeBag)
        scheduler.start()
        
        XCTAssertEqual(loginResult.events, [.error(10, loginError)])
        XCTAssertEqual(loadingResult.events, [.next(10, true), .next(10, false)])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
