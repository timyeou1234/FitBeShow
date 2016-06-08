//
//  CommentsTableViewController.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/2.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController, LikeButtonDelegat, CommentButtonDelegate {
    
//    override func viewWillAppear(animated: Bool) {
//        tableView.setContentOffset(CGPointMake(CGFloat(0), CGFloat(-50)) , animated: true)
//    }
    
    var userArray:[User] = []
    var rowAtSelect:Int = 0
    var tim = User(name: "Tim", selfieName: "selfie")
    var john = User(name:"John", selfieName: "first")
    var tom = User(name: "Tommy", selfieName: "clock")
    var Jonse = User(name: "Jones", selfieName: "facebook")
    
    
    
//    var commentContext:String = ""
//    var commentsTime = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.backgroundColor = UIColor(red: 69/255, green: 88/255, blue: 151/255, alpha: 1)
        
        tableView.contentInset.bottom = 50
        
        tableView.registerNib(UINib(nibName: "CommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tim.comments(UserWhoComments(comment: "Hi", likeNum: 20))
        john.comments(UserWhoComments(comment: "What's up?", likeNum: 15))
        tom.comments(UserWhoComments(comment:"蔡亞青，原本在臺南熱鬧市區上班，媽媽意外受傷，她回到嘉義東石­鄉幫忙，網友拍下她認真工作照片po網後，一夕暴紅，後來她考量­家族養蚵事業，長輩們年紀大了還辛苦工作，決定留下來工作，村裡­婆婆媽媽卻酸言酸語說她沒出息，一個年輕漂亮的女孩，捨棄繁華熱⋯⋯" ,likeNum: 15 ))
        
        userArray.append(tim)
        userArray.append(john)
        userArray.append(tom)
        
        tim.userWhoCommentsArray![0].commentContext(CommentsInComments(comment: "Hahahahahaha so Funny", time: "3月6日", user: tim))
        tom.userWhoCommentsArray![0].commentContext(CommentsInComments(comment: "有夠無聊？？？？？嫩！！？？？？？？？？？？？？？？？？", time: "4月8日", user: tim))
       
        tableView.allowsSelection = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func like(cell:CommentsTableViewCell) {
        print(self.tableView.indexPathForRowAtPoint(cell.center)!.section)
//        self.tableView.indexPathForCell(cell)
        cell.owner!.userWhoCommentsArray![0].likeNum += 1
        
        
        self.tableView.reloadData()
    }
    
    func dislike(cell:CommentsTableViewCell) {
        print(self.tableView.indexPathForRowAtPoint(cell.center)!.section)
        
        cell.owner!.userWhoCommentsArray![0].likeNum -= 1
        
        
        self.tableView.reloadData()
    }
    
    func commitComment() {
        
    }
    
    func showCommentSegue(cell:CommentsTableViewCell) {
        self.performSegueWithIdentifier("showPostSegue", sender: cell.owner)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CommentsTableViewCell
        
        cell.owner = userArray[indexPath.section]
        cell.delegate = self
        cell.commentDelegate = self
        
        cell.selfieImageView.image = UIImage(named: userArray[indexPath.section].selfieName)
        cell.nameLable.text = userArray[indexPath.section].name
//        cell.dayLable.text = commentsArray[indexPath.row].selfieDescription
        cell.likeLabe.text = "\(userArray[indexPath.section].userWhoCommentsArray![0].likeNum)人說讚"
        cell.contextLable.text = userArray[indexPath.section].userWhoCommentsArray![0].comment
        
        if userArray[indexPath.section].userWhoCommentsArray![0].commentsInCommentsArray?.count == 0{
            cell.viewForComments.addConstraint(NSLayoutConstraint(item: cell.viewForComments, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: cell.viewForComments, attribute: NSLayoutAttribute.Height, multiplier: 0.0, constant: 0))
        }else{
            cell.nameCommentsLable.text = userArray[indexPath.section].userWhoCommentsArray![0].commentsInCommentsArray![0].user!.name
            
            cell.commentsLable.text = userArray[indexPath.section].userWhoCommentsArray![0].commentsInCommentsArray![0].comment
            cell.commentsImageView.image = UIImage(named: userArray[indexPath.section].userWhoCommentsArray![0].commentsInCommentsArray![0].user!.selfieName)
        }
        
        
        
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPostSegue"{
            let destinationController = segue.destinationViewController as! CommentsInCommentsTableViewController
            destinationController.contextOwner = sender as? User
        }
    }
    

}
