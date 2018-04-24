//
//  MainViewController.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc(stroyName: "Home")
        addChildVc(stroyName: "Study")
        addChildVc(stroyName: "Exam")
        addChildVc(stroyName: "Profile")
    }

    private func addChildVc(stroyName: String) {
        //通过storyboard获取控制器
        let childVc = UIStoryboard(name: stroyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVc)
    }
}
