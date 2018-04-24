//
//  UIBarButtonItem-Extension.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //swift在扩展类里推荐用便利构造函数 1.convenince开头  2.在构造函数必须明确调用一个设计的构造函数（self)
    convenience init(imageName: String, highImageName: String = "", size: CGSize = .zero) {
        //1.创建UIButton
        let btn = UIButton()
        
        //2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        //3.设置btn的尺寸
        if size == .zero {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        //4.创建UIBarButtonItem
        self.init(customView: btn)
    }
}
