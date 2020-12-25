//
//  WebService.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import Foundation

typealias UsersCompletion = ([User]?, HTTPError?) -> ()
typealias PostsCompletion = ([Post]?, HTTPError?) -> ()
typealias CommentsCompletion = ([Comment]?, HTTPError?) -> ()

protocol UserServiceProtocol: class {
    func getUsers(completion: @escaping UsersCompletion)
}

protocol PostServiceProtocol: class {
    func getPosts(completion: @escaping PostsCompletion)
}

protocol CommentServiceProtocol: class {
    func getComments(for postId: String, completion: @escaping CommentsCompletion)
}

final class WebService: PostServiceProtocol, UserServiceProtocol, CommentServiceProtocol {
    
    private var dataService: DataServiceProtocol!
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    private var urlBuilder: URLComponents = {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = EndPoints.scheme
        urlBuilder.host = EndPoints.host
        return urlBuilder
    }()
    
    func getUsers(completion: @escaping UsersCompletion) {
        
        urlBuilder.path = EndPoints.usersPath
        guard let url = urlBuilder.url else { return }
        getData(for: url, completion: completion)
    }
    
    func getPosts(completion: @escaping PostsCompletion) {
        
        urlBuilder.path = EndPoints.postsPath
        guard let url = urlBuilder.url else { return }
        getData(for: url, completion: completion)
    }
    
    func getComments(for postId: String, completion: @escaping CommentsCompletion) {
        
        urlBuilder.path = EndPoints.commentsPath
        urlBuilder.queryItems = [
            URLQueryItem(name: "postId", value: postId)
        ]
        guard let url = urlBuilder.url else { return }
        getData(for: url, completion: completion)
    }
    
    private func getData<T: Decodable, U: Error>(for url: URL, completion: @escaping ([T]?, U?) -> ()){
        
        dataService.fetchData(for: url) { (data, err) in
            
            guard err == nil else{
                completion(nil, err as? U)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let object: [T] = try decoder.decode([T].self, from: data)
                completion(object, nil)
            } catch {
                debugPrint("Unable to decode data: \(error.localizedDescription)")
                completion(nil, HTTPError.invalidData as? U)
            }
        }
    }
}
