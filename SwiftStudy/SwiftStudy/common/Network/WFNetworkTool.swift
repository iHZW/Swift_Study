//
//  WFNetworkTool.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/29.
//  Copyright © 2022 HZW. All rights reserved.
//
//********** 自定义网络请求封装 **********
import UIKit
import Alamofire

let RootUrl = "这里是项目的域名"

//网络类型枚举：get post
enum MethodType {
    case get, post
}

//网络请求类型地址枚举
enum APIUrl: String {
    //登录
    case login  = "***"
    //注册
    case regist = "****"
    //其他根据自己项目接口文档自定义
}

class WFNetworkTool: NSObject {

    class func requestData(_ type : MethodType, URL : String, parameters : [String : Any], callBack :  @escaping (_ result : Any) -> ()) -> Void {
        
        //1. 获取网络请求类型和网络请求地址
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        let url = RootUrl + URL
        
        //2. 网络请求
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil)
        
        request.responseJSON { (response) in
            
            //3. 获取结果
            guard let result = response.result.value else {
                print("request error for : " + URL)
                print(response.result.error!)
                return
            }
            
            //4. 将结果回调出去
            callBack(result)
        }
    }
}
