//
//  UserWhoComments.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/6.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import Foundation

class UserWhoComments{

    let comment:String
    var likeNum:Int
    var commentsInCommentsArray:[CommentsInComments]?
    
    
    
    init (comment:String, likeNum:Int){
        
        self.comment = comment
        self.likeNum = likeNum
        self.commentsInCommentsArray = []
    }
    
    func commentContext(contextOfComment:CommentsInComments){
        self.commentsInCommentsArray?.append(contextOfComment)
    }
}