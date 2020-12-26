//
//  CommentCellViewModel.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import Foundation

struct CommentCellViewModel {
    let name: String
    let body: String
    var profileBgColorId: Int{
        return Int.random(in: 0...4)
    }
}
