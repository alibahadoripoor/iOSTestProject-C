//
//  DataServiceTests.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class DataServiceTests: XCTestCase {
    
    private func testDataServiceConnection() {
        let expectation = self.expectation(description: "Data Service Connection is OK")
        let url = URL(string: "https://jsonplaceholder.typicode.com/")!
        
        DataService().fetchData(for: url) { (data, err) in
            if data != nil{
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 8, handler: nil)
    }
}
