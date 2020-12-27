//
//  CommentServiceMock.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class CommentServiceMock: CommentServiceProtocol {
    
    func getComments(for postId: String, completion: @escaping CommentsCompletion) {
        
        let comment1 = Comment(id: 1, postId: 1, name: "name1", email: "email1", body: "body1")
        let comment2 = Comment(id: 2, postId: 1, name: "name2", email: "email2", body: "body2")
        completion([comment1, comment2], nil)
    }
}
