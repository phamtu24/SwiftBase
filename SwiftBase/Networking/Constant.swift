//
//  Constant.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

let baseUrl = "http://winds.hopto.org:8521/api/Service"

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
