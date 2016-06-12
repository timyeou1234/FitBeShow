//
//  CommentsInCommentViewController.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/8.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class CommentsInCommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CommentButtonInCommentDelegate, LikeButtonInCommentDelegate {
    
    var contextOwner:User?
    var userNow:User = User(name: "Tim", selfieName: "selfie")
    var thisCommentIsLiked:Bool?
    
    @IBOutlet weak var textInputView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func sendComment(sender: AnyObject) {
        let newComments = CommentsInComments(comment: inputTextField.text!, time: "hihi", user: userNow)
        print(newComments)
        contextOwner!.userWhoCommentsArray![0].commentContext(newComments)
        
        inputTextField.text = ""
        self.tableView.reloadData()
    }

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.registerNib(UINib(nibName: "CommentsInCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        
        tableView.registerNib(UINib(nibName: "ContextOfCommentsInCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "CellForComments")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommentsInCommentViewController.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)

        
    }
    
    func keyboardWasShown(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height - 50
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ((contextOwner?.userWhoCommentsArray![0].commentsInCommentsArray?.count)! + 1)
    }
    
    func commitComment() {
        
    }
    
    func showCommentSegue(cell: CommentsInCommentsTableViewCell) {
        
    }
    
    func like() {
        contextOwner!.userWhoCommentsArray![0].like()
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CommentsInCommentsTableViewCell
        
        let cellForComments = tableView.dequeueReusableCellWithIdentifier("CellForComments", forIndexPath: indexPath) as! ContextOfCommentsInCommentsTableViewCell
        
        thisCommentIsLiked = contextOwner!.userWhoCommentsArray![0].liked
        
        switch indexPath.row {
        case 0:
            if thisCommentIsLiked!{
                cell.likeButtonView.setTitleColor(.blueColor(), forState: UIControlState.Normal)
            }else{
                cell.likeButtonView.setTitleColor(.grayColor(), forState: UIControlState.Normal)
            }
            cell.likeNumLable.text = "\(contextOwner!.userWhoCommentsArray![0].likeNum)人說讚"
            cell.nameLable.text = contextOwner!.name
            cell.commentLable.text = contextOwner!.userWhoCommentsArray![0].comment
            cell.selfieImageView.image = UIImage(named: (contextOwner?.selfieName)!)
            
            cell.delegateLike = self
            cell.delegateComment = self
            return cell
        default:
            cellForComments.commentContextLable.text = contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].comment
            
            cellForComments.nameWhoCommentsLable.text = contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].user!.name
            
            cellForComments.commentSelfieImageView.image = UIImage(named: contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].user!.selfieName)
            return cellForComments
        
        }
        
        
    }
    
}

