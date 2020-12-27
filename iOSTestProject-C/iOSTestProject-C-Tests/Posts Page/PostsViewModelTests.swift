//
//  PostsViewModelTests.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class PostsViewModelTests: XCTestCase {

    private let viewModel = PostsViewModel(userService: UserServiceMock(), postService: PostServiceMock())
    
    private func testViewDidLoad(){
        
        let expectation = self.expectation(description: "View Did Load Successfully")

        viewModel.onUpdate = {
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    private func testCellsNumber(){
        
        viewModel.viewDidLoad()
        let cellsNumber = viewModel.cellsNumber()
        XCTAssertNotNil(cellsNumber)
        XCTAssertEqual(cellsNumber, 3)
    }
    
    private func testSetCellViewModel(){
        
        viewModel.viewDidLoad()
        let indexPath = IndexPath(item: 2, section: 0)
        let postCellViewModel = viewModel.setCellViewModel(for: indexPath)
        XCTAssertNotNil(postCellViewModel)
        XCTAssertEqual(postCellViewModel!.authorName, "name2")
        XCTAssertEqual(postCellViewModel!.authorUserName, "userName2")
        XCTAssertEqual(postCellViewModel!.postTitle, "title3")
        XCTAssertNotNil(postCellViewModel!.profileBgColorId)
    }

}
