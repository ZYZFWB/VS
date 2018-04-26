//
//  DemoViewController.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    func setupUI() {
        view.backgroundColor = UIColor.randomColor()
    }
    
    func loadData() {
        
    }
}
