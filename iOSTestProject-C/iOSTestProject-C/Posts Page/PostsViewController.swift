//
//  PostsViewController.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import UIKit

final class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables and Constants
    
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
        
        title = "Posts"
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "PostCell")
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

extension PostsViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.cellsNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        
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
