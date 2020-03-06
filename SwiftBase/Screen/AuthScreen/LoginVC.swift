//
//  LoginScreen.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/4/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginViewController : UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var error: String?
    var loginViewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
         
    }

    
    func bindData() {
        
        txtUsername.rx.text
            .orEmpty
            .bind(to: loginViewModel.username)
            .disposed(by: disposeBag)
        
        txtPassword.rx.text
            .orEmpty
            .bind(to: loginViewModel.password)
            .disposed(by: disposeBag)
        
        loginViewModel
            .error
            .subscribe(onNext: { err in
                self.view.makeToast(err)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        loginViewModel.login(completion: goToMain)
//        goToMain()
    }
    
    func goToMain() {
     let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
     let homeViewController = storyBoard.instantiateViewController(withIdentifier: "Home")
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }
    
}
