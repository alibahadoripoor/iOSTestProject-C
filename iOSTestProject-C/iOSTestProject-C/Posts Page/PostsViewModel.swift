//
//  PostsViewModel.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import UIKit

final class PostsViewModel{
    
    private var userService: UserServiceProtocol!
    private var postService: PostServiceProtocol!
    private var users: [User] = []
    private var posts: [Post] = []
    var onUpdate: ()->() = {}
    
    init(userService: UserServiceProtocol = WebService(),
         postService: PostServiceProtocol = WebService()) {
        
        self.userService = userService
        self.postService = postService
    }
    
    func viewDidLoad(){
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        
        userService.getUsers { [weak self] (users, error) in
            
            guard error == nil else {
                //Handle the errors
                return
            }
            
            self?.users = users ?? []
            group.leave()
        }
        
        postService.getPosts { [weak self] (posts, error) in
            
            guard error == nil else {
                //Handle the errors
                return
            }
            
            self?.posts = posts ?? []
            group.leave()
        }
        
        group.notify(queue: .main, execute: { [weak self] in
            
            for i in 0..<(self?.users.count ?? 0){
                self?.users[i].colorId = Int.random(in: 0...4)
            }
            self?.onUpdate()
        })
    }
    
    func cellsNumber() -> Int{
        
        return posts.count
    }
    
    func setCellViewModel(for indexPath: IndexPath) -> PostCellViewModel?{
        
        let post = posts[indexPath.item]
        guard let user = users.filter({ $0.id == post.userId }).first else { return nil }
        return PostCellViewModel(authorName: user.name, authorUserName: user.userName, postTitle: post.title, profileBgColorId: user.colorId ?? 0)
    }
    
    func cellDidSelect(at indexPath: IndexPath, navController: UINavigationController){
        
        let post = posts[indexPath.item]
        guard let user = users.filter({ $0.id == post.userId }).first else { return }
        let postDetailsVM = PostDetailsViewModel(post: post, user: user)
        let postDetailsVC = PostDetailsViewController()
        postDetailsVC.viewModel = postDetailsVM
        navController.pushViewController(postDetailsVC, animated: true)
    }
}
