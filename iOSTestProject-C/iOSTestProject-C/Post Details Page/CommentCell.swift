//
//  CommentCell.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 25.12.20.
//

import UIKit

final class CommentCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    @IBOutlet weak var authorProfileLabel: UILabel!{
        didSet{
            authorProfileLabel.layer.cornerRadius = 17
        }
    }
    
    var viewModel: CommentCellViewModel?{
        didSet{
            guard let viewModel = viewModel else { return }
            
            authorNameLabel.text = viewModel.name
            authorProfileLabel.text = String(viewModel.name.first ?? " ")
            commentBodyLabel.text = viewModel.body
            commentBodyLabel.textColor = .systemGray
        }
    }
}
