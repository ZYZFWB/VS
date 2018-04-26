//
//  HomeCycleView.swift
//  VS
//
//  Created by zzr on 2018/4/25.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class HomeCycleView: UIView {

    //MARK: - 定义属性
    var cycleTimer: Timer?
    var cycleModels: [CycleModel]? {
        didSet {
            //1.刷新数据
            collectionView.reloadData()
            
            //2.设置pageController个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            //3.默认滚打中间某个位置
            let indexPath = IndexPath(item: (cycleModels?.count ?? 0)*10, section: 0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            
            //4.添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    //MARK: -  控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    //MARK:- 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
        //注册cell
        collectionView.register(UINib(nibName: "CycleCVCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
        
        
    }
    
    //重写方法，设置collectionView里面的layout和布局（其他在xib设置）
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        //设置CollectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
    
    
}

//MARK: - 提供一个快速创建view类方法
extension HomeCycleView {
    class func homeCycleView() -> HomeCycleView {
        return Bundle.main.loadNibNamed("HomeCycleView", owner: nil, options: nil)?.first as! HomeCycleView
    }
}

//MARK: - 遵守UICollectionViewDataSouce数据源协议
extension HomeCycleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CycleCVCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        return cell
    }
}

//MARK: - 遵守UICollectionViewDelegate协议
extension HomeCycleView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2.计算pageControl的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

//MARK: - 定时器操作方法
extension HomeCycleView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
    }
    
    @objc fileprivate func scrollToNext() {
        // 1.获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        // 2.滚动该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}













