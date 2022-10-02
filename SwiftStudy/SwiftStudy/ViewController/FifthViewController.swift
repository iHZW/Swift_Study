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
        
        let topSpace = kSafeAreaTopStatusNavBarHeight
        let bottomSpace = kSafeAreaBottomStatusTabBarHeight
        let mainHeight = kMainSCreenHeight
        let viewHeight = CGRectGetHeight(self.view.frame)
        
        let rect = CGRect(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaBottomStatusTabBarHeight)
        self.wkWebview = WKWebView.init(frame:rect, configuration: config);
        self.view.addSubview(self.wkWebview!)
        
        //添加工具条
        let toolView = UIView(frame: CGRect(x: 15, y: kMainSCreenHeight - kSafeAreaBottomStatusTabBarHeight - 40, width: kMainScreenWidth - 30, height: 40))
            .backgroundColor(.cyan)
        self.view.addSubview(toolView)
        
        let leftBtn = UIButton(type: .custom)
            .frame(CGRect(x: 15, y: 0, width: 100, height: 40))
            .title("后退")
            .textColor(.white)
            .backgroundColor(.systemPink)
            .add(self, action: #selector(leftAction))
                
        let rightBtn = UIButton(type: .custom)
            .frame(CGRect(x: CGRectGetMaxX(leftBtn.frame) + 20, y: 0, width: 100, height: 40))
            .title("前进")
            .textColor(.white)
            .backgroundColor(.gray)
            .add(self, action: #selector(rightAction))


        toolView.addSubview(leftBtn)
        toolView.addSubview(rightBtn)
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
    
    @objc func leftAction() {
        if ((self.wkWebview?.canGoBack) != nil) {
            self.wkWebview?.goBack()
        }
    }
    
    @objc func rightAction() {
        if ((self.wkWebview?.canGoForward) != nil) {
            self.wkWebview?.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("canGoBack = \(webView.canGoBack) canGoForward = \(webView.canGoForward)")
    }
    
    
    //app端接收web端数据(通过代理方法)
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //message.body 即为web端传送数据
        //转换message.body使用
    }
    
}
