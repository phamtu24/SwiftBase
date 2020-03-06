//
//  Networking.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(value:String, password:String, type: String)
    case getListCategory
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getListCategory :
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "LoginApp"
        case .getListCategory:
            return "getListCategory"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let value, let password, let type):
            return ["value": value, "password": password, "type": type]
        case .getListCategory:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        let token = UserDefaults.standard.object(forKey: "token") as? String
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(token ?? "",
                            forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}


