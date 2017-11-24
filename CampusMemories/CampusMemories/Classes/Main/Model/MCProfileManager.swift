//
//  MCProfileManager.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/13.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit
import SwiftyJSON

class MCProfileManager {
    
    private var userProfile: MCUserProfile?
    
    // 使用单例模式管理用户信息
    static let shared = MCProfileManager.init()
    
    private init() {
        
    }
    
    // 获取用户信息的浅拷贝方法
    func loadUserProfile() -> MCUserProfile? {
        return userProfile
    }
    
    //FIXME: 获取用户信息的深拷贝方法
//    func copyUserProfile() -> MCUserProfile {
//
//    }
    
    func updateUserProfile(json: JSON) {
        userProfile = MCUserProfile(json: json)
        // 发送消息通知所有vc
        DispatchQueue.main.async {
            let notificationName = Notification.Name(rawValue: "UserProfileChanged")
            NotificationCenter.default.post(name: notificationName, object: self)
        }
    }
    
    // 注册用户接口
    func registerUser(with userProfile: MCUserProfile) -> Bool {
        // FIXME: 注册接口
        return false
    }
    
    // 用户信息修改接口
    func changeUserProfile(with userProfile: MCUserProfile) -> Bool {
        // FIXME: 修改接口
        return false
    }
    
}
