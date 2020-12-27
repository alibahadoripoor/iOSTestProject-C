//
//  WebServiceTests.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class WebServiceTests: XCTestCase {
    
    private let postService: PostServiceProtocol = WebService(dataService: PostsDataServiceMock())
    private let userService: UserServiceProtocol = WebService(dataService: UsersDataServiceMock())
    private let CommentService: CommentServiceProtocol = WebService(dataService: CommentsDataServiceMock())
    
    private func testGetPosts(){
        
        postService.getPosts { (posts, error) in
            
            guard let posts = posts else { return }
            XCTAssertEqual(posts[0].id, 1)
            XCTAssertEqual(posts[0].userId, 1)
            XCTAssertEqual(posts[0].title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
            XCTAssertEqual(posts[0].body, "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
            XCTAssertEqual(posts.count, 100)
        }
    }
    
    private func testGetUsers(){
        
        userService.getUsers { (users, error) in
            
            guard let users = users else { return }
            
            XCTAssertEqual(users[0].id, 1)
            XCTAssertEqual(users[0].name, "Leanne Graham")
            XCTAssertEqual(users[0].userName, "Bret")
            XCTAssertEqual(users[0].email, "Sincere@april.biz")
            XCTAssertEqual(users.count, 10)
            XCTAssertNil(users[0].colorId)
        }
    }
    
    private func testGetComments(){
        
        CommentService.getComments(for: "1") { (comments, error) in
            
            guard let comments = comments else { return }
            XCTAssertEqual(comments[0].id, 1)
            XCTAssertEqual(comments[0].postId, 1)
            XCTAssertEqual(comments[0].name, "id labore ex et quam laborum")
            XCTAssertEqual(comments[0].email, "Eliseo@gardner.biz")
            XCTAssertEqual(comments[0].body, "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
            XCTAssertEqual(comments.count, 5)
        }
    }
}
