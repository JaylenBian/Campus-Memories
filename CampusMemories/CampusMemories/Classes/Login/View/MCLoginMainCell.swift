//
//  MCLoginMainCell.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCLoginMainCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nicknameField: MCTextField!
    @IBOutlet weak var passwordField: MCTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupTfImage()
        setTextOffset()
    }
    
    fileprivate func setupTfImage() {
        nicknameField.leftView = UIImageView(image: UIImage(named: "login_Account")?.withRenderingMode(.alwaysOriginal))
        nicknameField.leftViewMode = .always
        
        passwordField.leftView = UIImageView(image: UIImage(named: "login_Password")?.withRenderingMode(.alwaysOriginal))
        passwordField.leftViewMode = .always
    }
    
    fileprivate func setTextOffset() {
        
    }
    
    func resignAllTF() {
        for subViewItem in self.view.subviews {
            if subViewItem is MCTextField {
                subViewItem.resignFirstResponder()
            }
        }
    }
    
}
