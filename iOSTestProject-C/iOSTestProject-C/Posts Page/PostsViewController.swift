//
//  PostsViewController.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import UIKit

final class PostsViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables and Constants
    
    private let refreshControl = UIRefreshControl()
    private let postCell = "PostCell"
    var viewModel: PostsViewModel!
    
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
        title = "Posts"
        
        ///tableView setup
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: postCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: postCell)
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

extension PostsViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.cellsNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath)
        
        if let postCell = cell as? PostCell {
            postCell.viewModel = viewModel.setCellViewModel(for: indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.cellDidSelect(at: indexPath, navController: navigationController!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
