//
//  PostCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import UIKit

final class PostCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 22
        }
    }
    
    var viewModel: PostCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            authorProfileLabel.text = String(viewModel.authorName.first ?? " ")
            
            switch viewModel.profileBgColorId {
            case 0: authorProfileLabel.backgroundColor = .systemPurple
            case 1: authorProfileLabel.backgroundColor = .systemRed
            case 2: authorProfileLabel.backgroundColor = .systemGreen
            case 3: authorProfileLabel.backgroundColor = .systemBlue
            case 4: authorProfileLabel.backgroundColor = .systemOrange
            default: break
            }
            
            let atributedString = NSMutableAttributedString(string: viewModel.authorName, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label])
            atributedString.append(NSMutableAttributedString(string: " @" + viewModel.authorUserName, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.systemGray]))
            authorNameLabel.attributedText = atributedString
            
            postTitleLabel.text = viewModel.postTitle
        }
    }
}
