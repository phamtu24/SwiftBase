//
//  HomeVM.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/2/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class HomeViewModel {
    var categories: PublishSubject<[Category]> = PublishSubject()
    var isLoading: PublishSubject<Bool> = PublishSubject()
    var isError: PublishSubject<AFError> = PublishSubject()
    
    func resquestData() {
        isLoading.onNext(true)
        NetworkClient.getListCategory { (res) in
            switch res {
            case .success(let res):
                self.categories.onNext(res.data ?? [])
                self.isLoading.onNext(false)
            case .failure(let err):
                self.isError.onNext(err)
                self.isLoading.onNext(false)
            }
        }
    }
}
