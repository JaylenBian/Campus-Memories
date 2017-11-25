//
//  MCDiscoverVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/24.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCDiscoverVC: MCMainVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
        self.navigationItem.title = "发现"
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    override func reloadData() {
         print("<Discover> reloading data")
    }

}
