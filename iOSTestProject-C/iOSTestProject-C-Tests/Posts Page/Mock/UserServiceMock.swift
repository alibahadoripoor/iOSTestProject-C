//
//  UserServiceMock.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

class UserServiceMock: UserServiceProtocol {
    
    func getUsers(completion: @escaping UsersCompletion) {
        
        let user1 = User(id: 1, name: "name1", userName: "userName1", email: "email1", colorId: nil)
        let user2 = User(id: 2, name: "name2", userName: "userName2", email: "email2", colorId: nil)
        completion([user1, user2], nil)
    }
}
