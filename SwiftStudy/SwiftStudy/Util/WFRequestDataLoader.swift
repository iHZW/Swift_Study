//
//  WFRequestDataLoader.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/11.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import HandyJSON
import Alamofire


enum WFResultState:Int,HandyJSONEnum {
    case success = 0        //成功
    case sessionError = 97  //登录失败
    case errrorMessage = 99
    case error = 100        //错误
}


class WFRequestDataLoader: NSObject {

    typealias HttpSuccess = ((_ result:HomeListModel) -> Void)
    static func request( method:HTTPMethod,url:URLConvertible,parameters:Parameters? = nil,success:@escaping HttpSuccess){
        Alamofire.request(url, method:method, parameters:parameters).responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                if let jsonString = response.result.value {
                    //将返回的JSON数据转换成AjaxResult模型的数据并将AjaxResult对象传回
                    if let obj = HomeListModel.deserialize(from: jsonString as? Dictionary){
                        success(obj)
                    }else{
                        let ajax = HomeListModel()
                        ajax.code = .error
                        success(ajax)
                    }
                }
            }else{
                let ajax = HomeListModel()
                ajax.code = .error
                success(ajax)
            }
        })
        
        Alamofire.request(url, method: method)
    }
    
}

