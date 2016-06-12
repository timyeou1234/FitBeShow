//
//  CommentsTableViewCell.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/2.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//
import UIKit

protocol LikeButtonDelegate:class {
    func like(cell:CommentsTableViewCell)
}

protocol CommentButtonDelegate:class {
    func showCommentSegue(cell:CommentsTableViewCell)
    func commitComment()
    
}

class CommentsTableViewCell: UITableViewCell {
    
    weak var delegate:LikeButtonDelegate?
    
    weak var commentDelegate: CommentButtonDelegate?
    
    weak var owner:User?
    
    weak var rowAtSelectIndexpath:NSIndexPath?
    
    @IBOutlet weak var likeLabe: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var contentViewForMargin: UIView!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var contextLable: UILabel!
    @IBOutlet weak var selfieImageView: UIImageView!
    
    @IBOutlet weak var likeButtonView: UIButton!
    @IBAction func likeButton(sender: AnyObject) {
        delegate?.like(self)
        }
    
    @IBAction func commentButton(sender: AnyObject) {
        commentDelegate?.showCommentSegue(self)
        commentDelegate?.commitComment()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        likeButtonView.setTitleColor(.grayColor(), forState: UIControlState.Normal)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
