//
//  BaseWebViewController.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/15.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import WebKit

class BaseWebViewController: BaseViewController {

    var requestUrl: String?
    var titleName: String?
    private var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.titleName ?? "网页"
        //初始化WKWebView
        var webViewRect = self.view.frame
        webViewRect.origin.y += 64
        webViewRect.size.height -= 64
        self.wkWebView = WKWebView.init(frame: webViewRect)
        //地址：
        let url = URL.init(string: self.requestUrl!)
        //请求：
        let request = URLRequest(url: url!);
        
        //添加一个简单的html页面
        self.wkWebView?.load(request)
        //加载本地html资源
//        self.wkWebView.load(URLRequest.init(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)))
        
        self.view.addSubview(self.wkWebView!)

    }
    
}
