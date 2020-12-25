//
//  User.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import Foundation

struct User: Decodable{
    let id: Int
    let name: String
    let userName: String
    let email: String
    var colorId: Int?
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case email
    }
}
