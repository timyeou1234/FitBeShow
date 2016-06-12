//
//  CommentsInCommentsTableViewCell.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/8.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

protocol LikeButtonInCommentDelegate:class {
    func like()
    }

protocol CommentButtonInCommentDelegate:class {
    func showCommentSegue(cell:CommentsInCommentsTableViewCell)
    func commitComment()
    
}

class CommentsInCommentsTableViewCell: UITableViewCell {
    
    weak var delegateComment:CommentButtonInCommentDelegate?
    weak var delegateLike:LikeButtonInCommentDelegate?
    
    @IBOutlet weak var likeButtonView: UIButton!
    @IBOutlet weak var likeNumLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var commentLable: UILabel!
    @IBOutlet weak var selfieImageView: UIImageView!
    @IBAction func commentButtonAction(sender: AnyObject) {
        delegateComment?.commitComment()
        delegateComment?.showCommentSegue(self)
        
    }
    @IBAction func likeButtonAction(sender: AnyObject) {
        delegateLike?.like()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
