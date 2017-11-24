//
//  MCProfileCellProvider.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/23.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

final class MCProfileCellProvider: NSObject {
    
    static let shared = MCProfileCellProvider.init()
    
    var dataArr: [[String]] = []
    
    private override init() {
        super.init()
        
        // 构造arr1
        let arr1 = ["修改个人信息"]
        // 构造arr2
        var arr2 = ["评分"]
        if UIApplication.shared.canOpenURL(URL(string: "mqq://")!) {
            arr2.insert("联系我们", at: 0)
        }
        // 构造arr3
        let arr3 = ["关于"]
        
        dataArr = [arr1, arr2, arr3]
    }
    
    func storyboardID(with text:String) -> String {
        var result = ""
        
        switch text {
        case "修改个人信息":
            result = "sbToProfileEditor"
        case "关于":
            result = "sbToAbout"
        default:
            result = ""
        }
        
        return result
    }
    
    func imageName(with text: String) -> String {
        var result = ""
        
        switch text {
        case "修改个人信息":
            result = "profile_edit"
        case "联系我们":
            result = "profile_qq"
        case "评分":
            result = "profile_score"
        case "关于":
            result = "profile_about"
        default:
            result = ""
        }
        
        return result
    }
    
}
