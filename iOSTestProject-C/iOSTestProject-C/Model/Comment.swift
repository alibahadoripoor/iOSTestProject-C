//
//  Comment.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import Foundation

struct Comment: Decodable{
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}
