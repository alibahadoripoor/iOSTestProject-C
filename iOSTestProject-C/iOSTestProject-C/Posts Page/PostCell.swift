//
//  PostCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 24.12.20.
//

import UIKit

final class PostCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 22
        }
    }
    
    //MARK: - Variables and Constants
    
    var viewModel: PostCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            ///authorProfileLabel setup
            authorProfileLabel.text = String(viewModel.authorName.first ?? " ")
            
            ///authorProfileLabel setup
            switch viewModel.profileBgColorId {
            case 0: authorProfileLabel.backgroundColor = ColorPalette.flikerPink
            case 1: authorProfileLabel.backgroundColor = ColorPalette.purple
            case 2: authorProfileLabel.backgroundColor = ColorPalette.trypanBlue
            case 3: authorProfileLabel.backgroundColor = ColorPalette.ultramarineBlue
            case 4: authorProfileLabel.backgroundColor = ColorPalette.vividSkyBlue
            default: break
            }
            
            ///authorNameLabel setup
            let atributedString = NSMutableAttributedString(string: viewModel.authorName, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.label])
            atributedString.append(NSMutableAttributedString(string: " @" + viewModel.authorUserName, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.systemGray]))
            authorNameLabel.attributedText = atributedString
            
            ///postTitleLabel setup
            postTitleLabel.text = viewModel.postTitle
        }
    }
}
