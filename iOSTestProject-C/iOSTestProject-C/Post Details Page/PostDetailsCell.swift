//
//  PostDetailsCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

class PostDetailsCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postTitleAndBodyLabel: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 35
        }
    }
    
    //MARK: - Variables and Constants
    
    var viewModel: PostDetailsCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            ///authorProfileLabel setup
            authorProfileLabel.text = String(viewModel.authorName.first ?? " ")
            
            ///profileBgColorId setup
            switch viewModel.profileBgColorId {
            case 0: authorProfileLabel.backgroundColor = ColorPalette.flikerPink
            case 1: authorProfileLabel.backgroundColor = ColorPalette.purple
            case 2: authorProfileLabel.backgroundColor = ColorPalette.trypanBlue
            case 3: authorProfileLabel.backgroundColor = ColorPalette.ultramarineBlue
            case 4: authorProfileLabel.backgroundColor = ColorPalette.vividSkyBlue
            default: break
            }

            ///authorNameLabel setup
            let authorNameAtributedString = NSMutableAttributedString(string: viewModel.authorName, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor.label])
            authorNameAtributedString.append(NSMutableAttributedString(string: " @" + viewModel.authorUserName, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor.systemGray]))
            authorNameLabel.attributedText = authorNameAtributedString

            ///postTitleAndBodyLabel setup
            let postTitleAndBodyAtributedString = NSMutableAttributedString(string: viewModel.postTitle, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.label])
            postTitleAndBodyAtributedString.append(NSMutableAttributedString(string: " \n\n" + viewModel.postBody, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label]))
            postTitleAndBodyLabel.attributedText = postTitleAndBodyAtributedString
            
            ///commentsNumberLabel setup
            commentsNumberLabel.text = "\(viewModel.commentsNumber)" + " Comments"
        }
    }
}
