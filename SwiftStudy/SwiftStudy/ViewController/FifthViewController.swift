//
//  FifthViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit
//引入框架
import WebKit

class FifthViewController: BaseViewController, WKUIDelegate, WKScriptMessageHandler, WKNavigationDelegate {
    
    var wkWebview : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //地址：
        let url = URL.init(string: "https://www.baidu.com")
        //请求：
        let request = URLRequest(url: url!);
        //用户交互信息管理
        let userContent = WKUserContentController.init()
        //Touchealth 可以自定义，主要为了和h5交互提供标识
        userContent.add(self, name: "Touchealth")
        /*
         * js端直接使用以下代码发送消息给原生
         * window.webkit.messageHandlers.Touchealth.postMessage(message);
         */
        //初始化
        let config = WKWebViewConfiguration.init()
        config.userContentController = userContent
        self.wkWebview = WKWebView.init(frame:self.view.frame, configuration: config);
        self.view.addSubview(self.wkWebview!)
        
        //不要忘记实现代理
       self.wkWebview?.navigationDelegate = self;
       self.wkWebview?.uiDelegate = self;
       self.wkWebview?.load(request)
       self.wkWebview?.sizeToFit()

        //添加进度观察者  为了实现顶部加载提示条
//        if self.wkWebview != nil {
//             self.wkWebview?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
//        }
    }
    
    
    //app端接收web端数据(通过代理方法)
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //message.body 即为web端传送数据
        //转换message.body使用
    }
    
}
