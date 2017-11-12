//
//  MCGuideDoneCell.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCGuideDoneCell: UICollectionViewCell {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        loginButton.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
    }
    
    @objc fileprivate func loginHandler() {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainTabBarController = rootViewController as? MCMainTVC else {return}
        
        mainTabBarController.finishGuideController()
    }

}
