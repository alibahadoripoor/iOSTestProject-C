//
//  PostDetailsViewController.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

final class PostDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables and Constants
    
    var viewModel: PostDetailsViewModel!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCallBacks()
        viewModel.viewDidLoad()
    }
    
    //MARK: - Private functions
    
    private func setupUI(){
        
        title = "Post Details"
        tableView.delegate = self
        tableView.dataSource = self
        let postDetailsCellNib = UINib(nibName: "PostDetailsCell", bundle: nil)
        tableView.register(postDetailsCellNib, forCellReuseIdentifier: "PostDetailsCell")
        let commentCellNib = UINib(nibName: "CommentCell", bundle: nil)
        tableView.register(commentCellNib, forCellReuseIdentifier: "CommentCell")
        tableView.tableFooterView = UIView()
        activityIndicator.startAnimating()
    }
    
    private func setupCallBacks(){
        
        viewModel.onUpdate = { [weak self] in
            
            self?.activityIndicator.stopAnimating()
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Table view delegate and data source

extension PostDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.commentsNumber() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailsCell", for: indexPath)
            
            if let postDetailsCell = cell as? PostDetailsCell {
                postDetailsCell.viewModel = viewModel.setPostDetailsViewModel()
                postDetailsCell.separatorInset.left = view.frame.width
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        
        if let commentCell = cell as? CommentCell {
            commentCell.viewModel = viewModel.setCellViewModel(for: indexPath)
            commentCell.separatorInset.left = 74
        }
        
        return cell
    }
}
