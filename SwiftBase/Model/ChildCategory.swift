//
//  ChildCategory.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/6/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

struct ChildCategory : Codable {
    
    let childID : Int?
    let childName : String?
    
    enum CodingKeys: String, CodingKey {
        case childID = "childID"
        case childName = "childName"
    }
    
}
