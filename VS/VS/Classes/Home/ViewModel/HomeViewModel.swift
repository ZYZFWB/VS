//
//  HomeViewModel.swift
//  VS
//
//  Created by zzr on 2018/4/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {

    //MARK： - 属性
    lazy var cycleModels: [CycleModel] = []
    
    
}

//MARK: - 网络请求
extension HomeViewModel {
    //请求无限轮播的数据
    func requestCycleData(_ finishCallBack : @escaping () -> ()) {
        
        
        
        NetworkTools.requestData(type: .get, UILString: "http://capi.douyucdn.cn/api/v1/slide/6?version=2.300") { (result) in

            guard let resultDict = result as? [String:Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String:Any]] else {return}

            for dict in dataArray {

                self.cycleModels.append(CycleModel(dict: dict))
            }

            finishCallBack()
        }
        
    }
}
