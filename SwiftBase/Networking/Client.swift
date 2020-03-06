//
//  Client.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import UIKit
import Alamofire

class NetworkClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                            completion(response.result)
        }
    }

    static func login(value: String, password: String,type: String, completion:@escaping (AFResult<JsonData<User>>)->Void) {
        performRequest(route: APIRouter.login(value: value, password: password, type: type), completion: completion)
        
    }
    
    static func getListCategory(completion: @escaping (AFResult<JsonData<[Category]>>)->Void) {
        performRequest(route: APIRouter.getListCategory, completion: completion)
    }

}
