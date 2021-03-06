//
//  NetworkTools.swift
//  VideoStudy
//
//  Created by zzr on 2018/4/11.
//  Copyright © 2018年 zzr. All rights reserved.
//

import UIKit
import Alamofire

enum MethType {
    case get
    case post
}

class NetworkTools {
    class func requestData(type: MethType, UILString: String, parameters: [String : Any]? = nil, finishedCallback: @escaping (_ result : Any) ->()) {
        
        //1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(UILString, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let result = response.result.value else {
                print("出错了：\(response.result.error!)")
                return
            }
            finishedCallback(result)
        }
        
    }
}

