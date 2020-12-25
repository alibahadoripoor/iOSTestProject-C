//
//  Post.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import Foundation

struct Post: Decodable{
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
