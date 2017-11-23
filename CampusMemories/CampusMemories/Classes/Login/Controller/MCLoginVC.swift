//
//  MCLoginVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCLoginVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var loginMainCellPage: MCLoginMainCell?
    weak var loginRegisterCellPage: MCLoginRegisterCell?
    
    let loginMainCell = "loginMainCell"
    let loginRegisterCell = "loginRegisterCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registeCell()
        observeKeyboardNotifications()
        addCollectionViewGesture()
    }
    
    // 注册集合Cell
    fileprivate func registeCell() {
        self.collectionView.register(UINib(nibName: "MCLoginMainCell", bundle: nil), forCellWithReuseIdentifier: loginMainCell)
        self.collectionView.register(UINib(nibName: "MCLoginRegisterCell", bundle: nil), forCellWithReuseIdentifier: loginRegisterCell)
    }
    
    // 添加键盘消息观察者，在键盘弹出收回时调整窗口
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // 对CollectionView添加手势，收回键盘
    fileprivate func addCollectionViewGesture() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(resignTextField))
        
        self.collectionView.addGestureRecognizer(tapGes)
    }
    
    // 键盘弹出响应方法
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            // 设置界面frame
            
            let y = self.view.frame.height * 0.1
            self.view.frame = CGRect(x: 0, y: -y, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    // 键盘收回相应方法
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            // 设置界面frame
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    // 响应滚动CollectionView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        resignTextField()
    }
    
    // 取消文本框的第一响应者
    @objc fileprivate func resignTextField() {
        guard let loginMainCellPage = self.loginMainCellPage else {return}
        loginMainCellPage.resignAllTF()
        
        guard let loginRegisterCellPage = self.loginRegisterCellPage else {return}
        
        loginRegisterCellPage.resignAllTF()
    }
    
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewFlowLayout implemention
extension MCLoginVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: loginMainCell, for: indexPath) as! MCLoginMainCell
            cell.delegate = self
            loginMainCellPage = cell
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: loginRegisterCell, for: indexPath) as! MCLoginRegisterCell
            loginRegisterCellPage = cell
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

extension MCLoginVC: MCLoginMainCellDelegate {
    
    func loginMainCell(_ loginMainCell: MCLoginMainCell, scrollTo page: Int) {
        let indexPath = IndexPath(row: page, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func loginMainCellShouldLogin(_ loninMainCell: MCLoginMainCell) {
        
    }
    
}
