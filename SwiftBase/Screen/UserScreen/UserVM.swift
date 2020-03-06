//
//  UserVM.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/4/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class UserViewModel {
    var label = PublishSubject<Int>()
        
    func plus(value: Int) {
        label.onNext(value + 1)
    }
    
    func requestData() {
        
    }
}
