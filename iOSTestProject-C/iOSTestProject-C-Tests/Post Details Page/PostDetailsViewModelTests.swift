//
//  PostDetailsViewModelTests.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class PostDetailsViewModelTests: XCTestCase {

    private let viewModel = PostDetailsViewModel(
        post: Post(id: 1, userId: 2, title: "title1", body: "body1"),
        user: User(id: 2, name: "name2", userName: "userName2", email: "email2", colorId: 3),
        commentService: CommentServiceMock()
    )
    
    private func testViewDidLoad(){
        
        let expectation = self.expectation(description: "View Did Load Successfully")

        viewModel.onUpdate = {
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    private func testSetPostDetailsViewModel(){
        
        viewModel.viewDidLoad()
        let postDetailsViewModel = viewModel.setPostDetailsViewModel()
        XCTAssertNotNil(postDetailsViewModel)
        XCTAssertEqual(postDetailsViewModel!.authorName, "name2")
        XCTAssertEqual(postDetailsViewModel!.authorUserName, "userName2")
        XCTAssertEqual(postDetailsViewModel!.commentsNumber, "2")
        XCTAssertEqual(postDetailsViewModel!.postBody, "body1")
        XCTAssertEqual(postDetailsViewModel!.postTitle, "title1")
        XCTAssertEqual(postDetailsViewModel!.profileBgColorId, 3)
    }
    
    private func testCellsNumber(){
        
        viewModel.viewDidLoad()
        let commentsNumber = viewModel.commentsNumber()
        XCTAssertNotNil(commentsNumber)
        XCTAssertEqual(commentsNumber, 2)
    }
    
    private func testSetCellViewModel(){
        
        viewModel.viewDidLoad()
        let indexPath = IndexPath(item: 1 + 1 /* because of post details cell */, section: 0)
        let commentCellViewModel = viewModel.setCellViewModel(for: indexPath)
        XCTAssertNotNil(commentCellViewModel)
        XCTAssertEqual(commentCellViewModel!.body, "body2")
        XCTAssertEqual(commentCellViewModel!.name, "name2")
        XCTAssertNotNil(commentCellViewModel!.profileBgColorId)
    }
}
