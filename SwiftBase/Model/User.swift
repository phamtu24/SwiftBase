//
//  User.swift
//  DemoMVVM
//
//  Created by Tu Pham on 3/3/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//


//  Generated using https://jsonmaster.github.io
//  Created on March 04, 2020
//
import Foundation

struct User: Codable {

    let userID: Int
    let isAgent: Int
    let token: String
    let pointRanking: Int
    let rankName: String
    let description: String
    let noteNextLevel: String
    let rankLevel: Int
    let point: Int
    let typeLogin: Int
    let phone: String
    let customerName: String
    let dob: String
    let dobStr: String
    let sex: Int
    let email: String
    let provinceName: String
    let districtName: String
    let address: String
    let provinceID: Int
    let districtID: Int
    let urlAvatar: String

    private enum CodingKeys: String, CodingKey {
        case userID = "userID"
        case isAgent = "isAgent"
        case token = "token"
        case pointRanking = "pointRanking"
        case rankName = "rankName"
        case description = "description"
        case noteNextLevel = "noteNextLevel"
        case rankLevel = "rankLevel"
        case point = "point"
        case typeLogin = "typeLogin"
        case phone = "phone"
        case customerName = "customerName"
        case dob = "dob"
        case dobStr = "dobStr"
        case sex = "sex"
        case email = "email"
        case provinceName = "provinceName"
        case districtName = "districtName"
        case address = "address"
        case provinceID = "provinceID"
        case districtID = "districtID"
        case urlAvatar = "urlAvatar"
    }
}
