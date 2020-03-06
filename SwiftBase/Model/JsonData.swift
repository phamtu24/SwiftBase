//
//  JsonData.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

struct JsonData<T: Codable>: Codable {

    let status: Int
    let code: Int
    let message: String
    let data: T?

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
        case data = "data"
    }
}
