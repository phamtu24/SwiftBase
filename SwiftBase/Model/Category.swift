//
//  Category.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/6/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

struct Category : Codable {

        let childCategory : [ChildCategory]?
        let descriptionField : String?
        let id : Int?
        let image : String?
        let name : String?

        enum CodingKeys: String, CodingKey {
                case childCategory = "childCategory"
                case descriptionField = "description"
                case id = "id"
                case image = "image"
                case name = "name"
        }
}
