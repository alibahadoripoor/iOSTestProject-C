//
//  PostDetailsCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

class PostDetailsCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postTitleAndBodyLabel: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 35
        }
    }
    
    var viewModel: PostDetailsCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            authorProfileLabel.text = String(viewModel.authorName.first ?? " ")
            
            switch viewModel.profileBgColorId {
            case 0: authorProfileLabel.backgroundColor = .systemPurple
            case 1: authorProfileLabel.backgroundColor = .systemRed
            case 2: authorProfileLabel.backgroundColor = .systemGreen
            case 3: authorProfileLabel.backgroundColor = .systemBlue
            case 4: authorProfileLabel.backgroundColor = .systemYellow
            default: break
            }

            let authorNameAtributedString = NSMutableAttributedString(string: viewModel.authorName, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label])
            authorNameAtributedString.append(NSMutableAttributedString(string: " @" + viewModel.authorUserName, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.systemGray]))
            authorNameLabel.attributedText = authorNameAtributedString

            let postTitleAndBodyAtributedString = NSMutableAttributedString(string: viewModel.postTitle, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label])
            postTitleAndBodyAtributedString.append(NSMutableAttributedString(string: " \n\n" + viewModel.postBody, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label]))
            postTitleAndBodyLabel.attributedText = postTitleAndBodyAtributedString
            
            commentsNumberLabel.text = "\(viewModel.commentsNumber)" + " Comments"
        }
    }
}
