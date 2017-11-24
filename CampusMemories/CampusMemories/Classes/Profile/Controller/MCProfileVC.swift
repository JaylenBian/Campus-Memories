//
//  MCProfileVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/23.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit
import SVProgressHUD

class MCProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        // 设置形态
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        // 设置控件
        tableView.contentInset = UIEdgeInsets(top: heightOffset, left: 0, bottom: 0, right: 0)
        tableView.addSubview(headerImage)
        tableView.tableFooterView = UIView()
        // 设置属性
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var headerImage: UIImageView = {
        let image = UIImage(named: "profile_placeholder")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: heightOffset, width: view.frame.width, height: heightOffset)
        return imageView
    }()
    
    lazy var heightOffset = {
        view.frame.height*0.3
    }()
    
    let kCellMargin: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
//        registerCell()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "个人"
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    fileprivate func registerCell() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y
        
        if yOffset < -heightOffset {
            var currentFrame = headerImage.frame
            currentFrame.origin.y = yOffset
            currentFrame.size.height = -yOffset
            if yOffset <= -heightOffset-50 {
                let xOffset = (-heightOffset - 50 - yOffset) * 0.3
                currentFrame.origin.x = -xOffset
                currentFrame.size.width = scrollView.frame.width + xOffset*2
            }
            headerImage.frame = currentFrame
        }
        
    }
}

extension MCProfileVC {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MCProfileCellProvider.shared.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MCProfileCellProvider.shared.dataArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellId")
        }
        
        let text = MCProfileCellProvider.shared.dataArr[indexPath.section][indexPath.row]
        cell?.textLabel?.text = text
        cell?.imageView?.image = UIImage(named: MCProfileCellProvider.shared.imageName(with: text))
        
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = MCProfileCellProvider.shared.dataArr[indexPath.section][indexPath.row]
        
        if text == "联系我们" {
            UIApplication.shared.openURL(URL(string: api_qq)!)
        }
        else if text == "评分" {
            SVProgressHUD.showError(withStatus: "应用暂未上架")
        }
        else {
            let sbID = MCProfileCellProvider.shared.storyboardID(with: text)
            
            let storyboard = UIStoryboard(name: "Profile", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: sbID)
            vc.hidesBottomBarWhenPushed = true
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        }
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: kCellMargin))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return kCellMargin
    }
    
}
