//
//  CommentsPageCommentsBelowTableViewCell.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/11.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class CommentsPageCommentsBelowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentSelfieImageView: UIImageView!
    @IBOutlet weak var nameWhoCommentsLable: UILabel!
    @IBOutlet weak var commentContextLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
