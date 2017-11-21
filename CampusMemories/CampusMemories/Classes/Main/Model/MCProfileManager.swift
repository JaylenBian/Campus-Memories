//
//  MCProfileManager.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/13.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCProfileManager {
    
    private var userProfile: MCUserProfile?
    
    // 使用单例模式管理用户信息
    static let sharedInstance = MCProfileManager.init()
    
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
