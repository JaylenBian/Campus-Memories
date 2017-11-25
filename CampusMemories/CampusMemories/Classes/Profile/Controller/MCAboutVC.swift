//
//  MCAboutVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/24.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCAboutVC: UIViewController {

    weak var barImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "关于"
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

}
