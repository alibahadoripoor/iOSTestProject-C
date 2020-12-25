//
//  PostDetailsViewModel.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import Foundation

final class PostDetailsViewModel{
    
    private var commentService: CommentServiceProtocol!
    private var comments: [Comment] = []
    private var post: Post!
    private var user: User!
    var onUpdate: ()->() = {}
    
    init(post: Post, user: User,
         commentService: CommentServiceProtocol = WebService()) {
        
        self.commentService = commentService
        self.post = post
        self.user = user
    }
    
    func viewDidLoad(){
        
        commentService.getComments(for: "\(post.id)") { [weak self] (comments, error) in
            
            guard error == nil else {
                //Handle the errors
                return
            }
            
            self?.comments = comments ?? []
            self?.onUpdate()
        }
    }
    
    func setPostDetailsViewModel() -> PostDetailsCellViewModel?{
        return PostDetailsCellViewModel(profileBgColorId: user.colorId ?? 0, authorName: user.name, authorUserName: user.userName, postTitle: post.title, postBody: post.body, commentsNumber: "\(comments.count)")
    }
    
    func commentsNumber() -> Int{
        
        return comments.count
    }
    
    func setCellViewModel(for indexPath: IndexPath) -> CommentCellViewModel?{
        
        let comment = comments[indexPath.item - 1]
        return CommentCellViewModel(name: comment.name, body: comment.body)
    }
}
