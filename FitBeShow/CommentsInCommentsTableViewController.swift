//
//  CommentsInCommentsTableViewController.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/8.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import UIKit

class CommentsInCommentsTableViewController: UITableViewController {
    
    var contextOwner:User?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
    
        tableView.registerNib(UINib(nibName: "CommentsInCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        
        tableView.registerNib(UINib(nibName: "ContextOfCommentsInCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "CellForComments")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return ((contextOwner?.userWhoCommentsArray![0].commentsInCommentsArray?.count)! + 1)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CommentsInCommentsTableViewCell
        
        let cellForComments = tableView.dequeueReusableCellWithIdentifier("CellForComments", forIndexPath: indexPath) as! ContextOfCommentsInCommentsTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.nameLable.text = contextOwner!.name
            cell.commentLable.text = contextOwner!.userWhoCommentsArray![0].comment
            cell.selfieImageView.image = UIImage(named: (contextOwner?.selfieName)!)
            return cell
        case 1:
            cellForComments.commentContextLable.text = contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].comment
            
            cellForComments.nameWhoCommentsLable.text = contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].user!.name
            
            cellForComments.commentSelfieImageView.image = UIImage(named: contextOwner!.userWhoCommentsArray![0].commentsInCommentsArray![indexPath.row-1].user!.selfieName)
            return cellForComments
        default:
            return cell
        }
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
