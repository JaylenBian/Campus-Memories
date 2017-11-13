//
//  MCLoginRegisterCell.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCLoginRegisterCell: UICollectionViewCell {

    @IBOutlet weak var mainLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var textfieldContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func resignAllTF() {
        for subviewItem in textfieldContainer.subviews {
            if subviewItem is UITextField{
                subviewItem.resignFirstResponder()
            }
        }
    }

}
