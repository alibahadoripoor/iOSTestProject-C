//
//  PostServiceMock.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

class PostServiceMock: PostServiceProtocol {
    
    func getPosts(completion: @escaping PostsCompletion) {
        
        let post1 = Post(id: 1, userId: 1, title: "title1", body: "body1")
        let post2 = Post(id: 2, userId: 2, title: "title2", body: "body2")
        let post3 = Post(id: 3, userId: 2, title: "title3", body: "body3")
        completion([post1, post2, post3], nil)
    }
}
