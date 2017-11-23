//
//  MCLoginProfileItem.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/23.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCLoginProfileItem: NSObject {

    var nickname: String
    var password: String
    
    private override init() {
        self.nickname = ""
        self.password = ""
    }
    
    init(nickName:String, passWord: String) {
        self.nickname = nickName
        self.password = passWord
    }
    
}
