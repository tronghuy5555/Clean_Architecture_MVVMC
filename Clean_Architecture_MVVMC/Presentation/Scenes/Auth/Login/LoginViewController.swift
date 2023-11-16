//
//  ViewController.swift
//  Clean_Architecture_MVVMC
//
//  Created by Huy Pham on 12/10/2023.
//

import UIKit

class LoginViewController: BaseViewController {
    var loginViewModel: LoginViewModel?
    @IBOutlet var txtUsername: UITextField?
    @IBOutlet var txtPassword: UITextField?
    @IBOutlet var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindLoadingOverlay(loginViewModel?.loadingOverlayResult)
        txtUsername?.rx.controlEvent(.editingChanged).subscribe(
            onNext: {[weak self] _ in
                self?.loginViewModel?.validatedUsername(self?.txtUsername?.text)
            }).disposed(by: disposeBag)
        
        txtPassword?.rx.controlEvent(.editingChanged).subscribe(
            onNext: {[weak self] _ in
                self?.loginViewModel?.validatePassword(self?.txtPassword?.text)
            }).disposed(by: disposeBag)
        
        loginViewModel?.isEnableSubmitButton.bind(to: btnLogin.rx.isEnabled).disposed(by: disposeBag)
        
        btnLogin?.rx.controlEvent(.touchDown).subscribe(
            onNext: {[weak self] _ in
                self?.loginViewModel?.submitLogin(userName: self?.txtUsername?.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "", password: self?.txtPassword?.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
            }).disposed(by: disposeBag)
    }
}

