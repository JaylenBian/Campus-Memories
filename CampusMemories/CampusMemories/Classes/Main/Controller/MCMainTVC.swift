//
//  MCMainTVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCMainTVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFirstRun() {
            showGuideController()
        }
        else if isLoggedIn() {
            
        }
        else {
            addChildVc(storyName: "Home", title: "首页")
            addChildVc(storyName: "Discover", title: "发现")
            addChildVc(storyName: "Update", title: "动态")
            addChildVc(storyName: "Profile", title: "个人")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    private func addChildVc(storyName: String, title: String){
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        childVc.tabBarItem.title = title
        childVc.tabBarItem.image = UIImage(named: "tab_" + storyName + "_normal")
        childVc.tabBarItem.selectedImage = UIImage(named: "tab_" + storyName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //  设置TabBar选中颜色
        childVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .selected)
        
        addChildViewController(childVc)
    }

}

extension MCMainTVC {
    
    func isFirstRun() -> Bool {
        return true
    }
    
    func isLoggedIn() -> Bool {
        return false
    }
    
    @objc func showGuideController() {
        let storyboard = UIStoryboard(name: "Guide", bundle: nil)
        let guideVC = storyboard.instantiateInitialViewController() as! MCGuideVC
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            self.present(guideVC, animated: false, completion: nil)
        }
    }
    
    func finishGuideController() {
        dismiss(animated: false, completion: nil)
        
        showLoginController()
    }
    
    @objc func showLoginController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = storyboard.instantiateInitialViewController() as! MCLoginVC
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            self.present(loginVC, animated: false, completion: nil)
        }
    }
    
}
