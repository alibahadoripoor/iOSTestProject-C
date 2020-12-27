//
//  DataService.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import Foundation

typealias fetchDataCompletion = (Data?, HTTPError?) -> ()

protocol DataServiceProtocol {
    func fetchData(for url: URL, completion: @escaping (Data?, HTTPError?) -> ())
}

final class DataService: DataServiceProtocol{
    
    func fetchData(for url: URL, completion: @escaping (Data?, HTTPError?) -> ()){
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
            DispatchQueue.main.async {
                
                guard error == nil else {
                    debugPrint("The request is failed: \(error!.localizedDescription)")
                    completion(nil, .failedRequest)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    debugPrint("Unable to process response")
                    completion(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    debugPrint("Failure response: \(response.statusCode)")
                    completion(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    debugPrint("No data returned")
                    completion(nil, .noData)
                    return
                }
                
                completion(data, nil)
            }
        }
        
        task.resume()
    }
}
