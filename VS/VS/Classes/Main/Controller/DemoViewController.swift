//
//  DemoViewController.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        // Do any additional setup after loading the view.
        
        setUpUI()
    }

    func setUpUI() {
        self.title = "第\(navigationController?.childViewControllers.count ?? 0)个"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(showNext))
        
    }
    
    @objc func showNext() {
        let vc = DemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
