//
//  CycleCVCell.swift
//  VS
//
//  Created by zzr on 2018/4/25.
//  Copyright © 2018年 Rong. All rights reserved.
//

import UIKit
import Kingfisher

class CycleCVCell: UICollectionViewCell {

    //MARK: - 控件属性
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    //MARK: - 定义模型属性
    var cycleModel: CycleModel? {
        didSet {
            //guard let urlString = cycleModel?.pic_url else {return}
            let surl = (cycleModel?.pic_url)?.replacingOccurrences(of: "https", with: "http")
            let iconURl = URL(string: surl!)
            imageView.kf.setImage(with: iconURl)
            label.text = cycleModel?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
