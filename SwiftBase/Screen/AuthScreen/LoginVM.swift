//
//  LoginVM.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/4/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class LoginViewModel {
    var username = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    var error = PublishSubject<String>()
    
    func login (completion: @escaping () -> Void) {
        NetworkClient.login(value: username.value, password: password.value, type: "4") { (res) in
            switch res {
            case .success(let res) :
                UserDefaults.standard.set("token", forKey: res.data?.token ?? "")
                completion()
            case .failure(let err) :
                print(err)
                self.error.onNext(err.errorDescription ?? "")
            }
        }
//        let para : [String: String] = [
//            "value": username.value,
//            "password": password.value,
//            "type": "4",
//        ]
//        AF.request("\(baseUrl)/LoginApp", method: .post, parameters: para, encoder: JSONParameterEncoder.default).response { (data) in
//            print(data)
//        }
    }
}
