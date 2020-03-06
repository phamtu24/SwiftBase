//
//  UserVC.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/4/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit
import FBSDKLoginKit
import GoogleSignIn
import Toast_Swift

class UserViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var userViewModel = UserViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         GIDSignIn.sharedInstance().clientID = "347455646913-bc57qf9lrmm2l8bemlg1g9t4vcsavvur.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance()?.presentingViewController = self
        bindData()
    }
    
    func bindData() {
        userViewModel
            .label
            .subscribe(onNext: { value in
                self.label.text = String(value)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        userViewModel
            .plus(value: Int(label.text ?? "0") ?? 0)
    }
    @IBAction func btnLogin(_ sender: Any) {
        //        GIDSignIn.sharedInstance()?.signIn()
        let textView = UITextView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        let text = """
        <h2 style="background-color:DodgerBlue;">Hello World</h2>
        """
        let webView = WKWebView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        textView.attributedText = text.htmlToAttributedString
        textView.adjustsFontForContentSizeCategory = true
        webView.loadHTMLString(text, baseURL: nil)
        view.showToast(textView)
    }
}
