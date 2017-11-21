//
//  MCUserProfile.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/13.
//  Copyright © 2017年 Minecode. All rights reserved.
//

// 2017/11/17
// FIXME: 实现NSCopying方法
// 备注: (null)

import UIKit

class MCUserProfile: NSObject {
    
    var id: Int?
    var name: String?
    var pass: String?
    var sign: String?
    var sex: String?
    var blogcount: Int?
    var school: String?
    var age: Int?
    var qq: String?
    var tel: String?
    var number: String?
    var nick: String?
    var fanscount: Int?
    var uptime: String?
    var face: String?
    var sid: String?
    
    init(dict: [String: Any]) {
        super.init()
        
        self.setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        // 占位
    }
    
}
