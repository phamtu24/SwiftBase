//
//  Wrapper.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

struct WrapperData<T: Codable> {
    var value: T?
}

extension WrapperData: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            value = try container.decode(T.self)
        } catch {
            value = nil
        }
//        self.init()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
