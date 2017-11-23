//
//  MCLoginMainCell.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

// 2017/11/17
// FIXME: 界面重构需求
// 备注： 将学号和密码文本框重构至同一容器View中

import UIKit

class MCLoginMainCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nicknameField: MCTextField!
    @IBOutlet weak var passwordField: MCTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    weak var delegate: MCLoginMainCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupTfImage()
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    fileprivate func setupTfImage() {
        nicknameField.leftView = UIImageView(image: UIImage(named: "login_Account")?.withRenderingMode(.alwaysOriginal))
        nicknameField.leftViewMode = .always
        
        passwordField.leftView = UIImageView(image: UIImage(named: "login_Password")?.withRenderingMode(.alwaysOriginal))
        passwordField.leftViewMode = .always
    }
    
    func resignAllTF() {
        for subViewItem in self.view.subviews {
            if subViewItem is MCTextField {
                subViewItem.resignFirstResponder()
            }
        }
    }
    
    @IBAction func registeAction(_ sender: UIButton) {
        self.delegate?.loginMainCell(self, scrollTo: 1)
    }
    
    @objc func loginAction() {
        let nickname = nicknameField.text
        if nickname == "" {
            shakeTextFiled(with: nicknameField)
            return
        }
        
        let password = passwordField.text
        if password == "" {
            shakeTextFiled(with: passwordField)
            return
        }
        
        let profile: MCLoginProfileItem = MCLoginProfileItem(nickName: nickname!, passWord: password!)
        
        self.delegate?.loginMainCellShouldLogin(self, with: profile)
    }
    
    // 抖动特效
    fileprivate func shakeTextFiled(with textField: UITextField) {
        // 设置关键帧动画
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        // 设置动画周期
        animation.duration = 0.05
        animation.repeatCount = 5
        // 抖动幅度
        animation.values = [0, -10, 10, 0]
        // 恢复原样
        animation.autoreverses = true
        // 设置抖动中心，并开始动画
        textField.layer.add(animation, forKey: "rotation.x")
    }
    
}

// 登录界面Nib的代理方法，由登录控制器实现
protocol MCLoginMainCellDelegate: AnyObject {
    
    // 跳转到登录界面的某个页面
    func loginMainCell(_ loginMainCell: MCLoginMainCell, scrollTo page: Int)
    // 登录按钮点击响应操作
    func loginMainCellShouldLogin(_ loninMainCell: MCLoginMainCell, with profile: MCLoginProfileItem)
    
}
