//
//  CommentsDataServiceMock.swift
//  iOSTestProject-C-Tests
//
//  Created by Ali Bahadori on 26.12.20.
//

import XCTest
@testable import iOSTestProject_C

final class CommentsDataServiceMock: DataServiceProtocol {
    
    func fetchData(for url: URL, completion: @escaping (Data?, HTTPError?) -> ()) {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "Comments", withExtension: "json")!
        
        do{
            let exampleJSONData = try Data(contentsOf: url)
            completion(exampleJSONData, nil)
        }catch{
            completion(nil, .noData)
        }
    }
}
