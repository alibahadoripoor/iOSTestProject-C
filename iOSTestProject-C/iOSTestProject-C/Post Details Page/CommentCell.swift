//
//  CommentCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

final class CommentCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 22
        }
    }
    @IBOutlet weak var customBackgroundView: UIView!{
        didSet{
            customBackgroundView.layer.cornerRadius = 10
        }
    }
    
    //MARK: - Variables and Constants
    
    var viewModel: CommentCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            ///authorNameLabel setup
            authorNameLabel.text = viewModel.name
            
            ///commentBodyLabel setup
            commentBodyLabel.text = viewModel.body
            
            ///authorProfileLabel setup
            authorProfileLabel.text = String(viewModel.name.first ?? " ")
            
            ///profileBgColorId setup
            switch viewModel.profileBgColorId {
            case 0: authorProfileLabel.backgroundColor = ColorPalette.flikerPink
            case 1: authorProfileLabel.backgroundColor = ColorPalette.purple
            case 2: authorProfileLabel.backgroundColor = ColorPalette.trypanBlue
            case 3: authorProfileLabel.backgroundColor = ColorPalette.ultramarineBlue
            case 4: authorProfileLabel.backgroundColor = ColorPalette.vividSkyBlue
            default: break
            }
        }
    }
}
