//
//  User.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/3.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import Foundation


class User{
    let name:String
    let selfieName:String
    var userWhoCommentsArray:[UserWhoComments]?
//    let selfieDescription:String
//    let comment:String
//    let likeNum:Int
//    let commentForThisMassage:String
//    
    
    init (name:String, selfieName:String){
        self.name = name
        self.selfieName = selfieName
        self.userWhoCommentsArray = []
//        self.selfieDescription = selfieDescription
//        self.comment = comment
//        self.likeNum = likeNum
//        self.commentForThisMassage = commentForThisMassage
    }
    
    func comments(userWhoComments:UserWhoComments){
        self.userWhoCommentsArray?.append(userWhoComments)
    }
}
