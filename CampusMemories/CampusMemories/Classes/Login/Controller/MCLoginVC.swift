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
    
    fileprivate func registeCell() {
        self.collectionView.register(UINib(nibName: "MCLoginMainCell", bundle: nil), forCellWithReuseIdentifier: loginMainCell)
        self.collectionView.register(UINib(nibName: "MCLoginRegisterCell", bundle: nil), forCellWithReuseIdentifier: loginRegisterCell)
    }
    
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func addCollectionViewGesture() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(resignTextField))
        
        self.collectionView.addGestureRecognizer(tapGes)
    }
    
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            // 设置界面frame
            
            let y = self.view.frame.height * 0.1
            self.view.frame = CGRect(x: 0, y: -y, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            // 设置界面frame
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        resignTextField()
    }
    
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
