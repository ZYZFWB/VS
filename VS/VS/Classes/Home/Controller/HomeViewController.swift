//
//  HomeViewController.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        super.setupUI()
    }
    
    @objc fileprivate func showFriends() {
        let vc = DemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
