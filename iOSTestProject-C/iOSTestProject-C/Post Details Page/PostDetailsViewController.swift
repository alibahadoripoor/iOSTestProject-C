//
//  PostDetailsViewController.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

final class PostDetailsViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables and Constants
    
    private let refreshControl = UIRefreshControl()
    private let postDetailsCell = "PostDetailsCell"
    private let commentCell = "CommentCell"
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
        
        ///navigation setup
        title = "Post Details"
        
        ///tableView setup
        tableView.delegate = self
        tableView.dataSource = self
        let postDetailsCellNib = UINib(nibName: postDetailsCell, bundle: nil)
        tableView.register(postDetailsCellNib, forCellReuseIdentifier: postDetailsCell)
        let commentCellNib = UINib(nibName: commentCell, bundle: nil)
        tableView.register(commentCellNib, forCellReuseIdentifier: commentCell)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        refreshControl.addTarget(self, action: #selector(viewDidRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        ///activityIndicator setup
        activityIndicator.startAnimating()
    }
    
    @objc private dynamic func viewDidRefresh(){
        viewModel.viewDidLoad()
    }
    
    private func setupCallBacks(){
        
        viewModel.onUpdate = { [weak self] in
            
            self?.refreshControl.endRefreshing()
            self?.activityIndicator.stopAnimating()
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Table view delegate and data source

extension PostDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.commentsNumber() + 1 ///for the details cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: postDetailsCell, for: indexPath)
            
            if let postDetailsCell = cell as? PostDetailsCell {
                postDetailsCell.viewModel = viewModel.setPostDetailsViewModel()
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: commentCell, for: indexPath)
        
        if let commentCell = cell as? CommentCell {
            commentCell.viewModel = viewModel.setCellViewModel(for: indexPath)
        }
        
        return cell
    }
}
