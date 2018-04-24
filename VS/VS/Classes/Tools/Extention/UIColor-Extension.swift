//
//  UIColor-Extension.swift
//  VS
//
//  Created by Rong on 2018/4/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1)
    }
}
