//
//  CommentsInComments.swift
//  FitBeShow
//
//  Created by YeouTimothy on 2016/6/6.
//  Copyright © 2016年 YeouTimothy. All rights reserved.
//

import Foundation
class CommentsInComments {
    let comment:String
    let time:String
    weak var user:User?
    
    init(comment:String, time:String, user:User){
        self.comment = comment
        self.time = time
        self.user = user
    }
}