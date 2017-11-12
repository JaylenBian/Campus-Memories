//
//  MCGuideVC.swift
//  CampusMemories
//
//  Created by Minecode on 2017/11/12.
//  Copyright © 2017年 Minecode. All rights reserved.
//

import UIKit

class MCGuideVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Widget
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    // Constrains
    @IBOutlet weak var pageControlBottom: NSLayoutConstraint!
    @IBOutlet weak var skipButtonTop: NSLayoutConstraint!
    @IBOutlet weak var continueButtonTop: NSLayoutConstraint!
    
    // Data
    let guidePageCell = "guidePageCell"
    let guideDoneCell = "guideDoneCell"
    lazy var pages: [MCPageItem] = [
        // FIXME: 内容
        MCPageItem(dict: ["imageName":"moreInfo", "title":"发现更多", "detail":"在这里发现更多，做你想做的。\nE浏览附近感兴趣的群体，并加入他们。"]),
        MCPageItem(dict: ["imageName":"moreInspir", "title":"更多灵感，更多思路", "detail":"遇见更多志同道合者。\n并与他们保持联系。"]),
        MCPageItem(dict: ["imageName":"moreSimpler", "title":"更加简洁", "detail":"比以前更加简洁\n为你打造更加便捷的使用体验，更加轻松的找到你想要的。"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        setButton()
        
        pageControl.numberOfPages = pages.count + 1
    }
    
    fileprivate func registerCell() {
        // FIXME: Cell
        collectionView.register(UINib.init(nibName: "MCGuidePageCell", bundle: nil), forCellWithReuseIdentifier: guidePageCell)
        collectionView.register(UINib.init(nibName: "MCGuideDoneCell", bundle: nil), forCellWithReuseIdentifier: guideDoneCell)
    }
    
    fileprivate func setButton() {
        continueButton.addTarget(self, action: #selector(pageSkipHandler(sender:)), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(pageSkipHandler(sender:)), for: .touchUpInside)
        
    }
    
    @objc func pageSkipHandler(sender: UIButton) {
        let indexPath: IndexPath!
        if sender.tag == 100 {
            // continue button
            indexPath = IndexPath(row: pageControl.currentPage+1, section: 0)
            pageControl.currentPage += 1
        }
        else {
            // skip button
            indexPath = IndexPath(row: pages.count, section: 0)
            pageControl.currentPage = pages.count
        }
        if pageControl.currentPage == pages.count {
            moveItemRelativeToScreen(off: true)
        }
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNum: Int = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNum
        
        if pageNum == pages.count {
            moveItemRelativeToScreen(off: true)
        } else {
            moveItemRelativeToScreen(off: false)
        }
        
    }
    
    // 重构，代码复用
    func moveItemRelativeToScreen(off: Bool) {
        if off {
            let offset = -kScreenHeight * 0.1
            pageControlBottom.constant = offset
            skipButtonTop.constant = offset
            continueButtonTop.constant = offset
            // disable button to avoid crash
            skipButton.isEnabled = false
            continueButton.isEnabled = false
        } else {
            pageControlBottom.constant = 10
            skipButtonTop.constant = 0
            continueButtonTop.constant = 0
            skipButton.isEnabled = true
            continueButton.isEnabled = true
        }
        
        // layout subviews
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

// MARK: - UICollectionViewDelegate and UICollectionViewDatasource impeletation
extension MCGuideVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: guideDoneCell, for: indexPath)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: guidePageCell, for: indexPath) as! MCGuidePageCell
        
        cell.imageView.image = nil
        
        let page = pages[indexPath.row]
        cell.titleLabel.text = page.title
        cell.detailLabel.text = page.detail
//        cell.imageView.image = UIImage(named: page.imageName!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
}
