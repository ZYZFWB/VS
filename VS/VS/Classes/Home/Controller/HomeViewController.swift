//
//  HomeViewController.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

let kItemMargin: CGFloat = 10
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kHeaderViewH: CGFloat = 50

let kNormalCellID = "kNormalCellID"
let kHeaderViewID = "kHeaderViewID"

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH: CGFloat = 90

class HomeViewController: BaseViewController {

    
    
    //MARK: - 懒加载属性
    fileprivate lazy var homeViewModel: HomeViewModel = HomeViewModel()
    //课程分类
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        //collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "NormalCVCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "HeaderCRView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()
    //无限轮播
    fileprivate lazy var homeCycleView: HomeCycleView = {[unowned self] in
        let homeCycleView = HomeCycleView.homeCycleView()
        homeCycleView.frame = CGRect(x: 0, y: -kCycleViewH, width: kScreenW, height: kCycleViewH)
        return homeCycleView
    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupUI()
//    }

    //MARK: - 设置ui界面
    override func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
      
        view.addSubview(collectionView)
        collectionView.addSubview(homeCycleView)
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH, left: 0, bottom: 0, right: 0)
        super.setupUI()
    }
    
    @objc fileprivate func showFriends() {
        let vc = DemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK: - 加载数据
    override func loadData() {
        homeViewModel.requestCycleData {
            
            self.homeCycleView.cycleModels = self.homeViewModel.cycleModels
        }
    }
}

//MARK: - 遵守数据源
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! NormalCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        return headerView
    }
}
