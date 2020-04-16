//
//  BaseWebViewController.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/15.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import WebKit

private let kRequestDefaultUrl: String = "https://www.baidu.com"

class BaseWebViewController: BaseViewController {

    var requestUrl: String?
    var titleName: String?
    private var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.titleName ?? "网页"
        //初始化WKWebView
        var webViewRect = self.view.frame
        let navigationHeight = kSafeAreaTopStatusNavBarHeight
        webViewRect.origin.y += navigationHeight
        webViewRect.size.height -= navigationHeight
        self.wkWebView = WKWebView.init(frame: webViewRect)
        //地址：
        var url = URL.init(string: self.requestUrl!)
        if url == nil {
            //如果url不存在则加载默认的百度页面,防止crash
            url = URL.init(string: kRequestDefaultUrl)
        }
        //请求：
        let request = URLRequest(url: url!);
        //添加一个简单的html页面
        self.wkWebView?.load(request)
        //加载本地html资源
//        self.wkWebView.load(URLRequest.init(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)))
        
        self.view.addSubview(self.wkWebView!)

    }
    
}
