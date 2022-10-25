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

// MARK: -可以参考  https://www.jianshu.com/p/f7a05ae67a62  这个OC的写法

class FifthViewController: BaseViewController, WKUIDelegate, WKScriptMessageHandler, WKNavigationDelegate {
    
    var wkWebview : WKWebView?
    //进度条
    lazy var progressView : UIProgressView = {
        let progress = UIProgressView(frame: CGRectMake(0, kSafeAreaTopStatusNavBarHeight, kMainScreenWidth, 10))
        progress.progressTintColor = .green
        progress.progress = 0
        return progress
    }()
    
    
    
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
        //初始化, 创建网页配置
        let config = WKWebViewConfiguration.init()
        config.userContentController = userContent
        
        
        //配置进程池
        let processPool = WKProcessPool()
        config.processPool = processPool
        
        //创建偏好设置对象
        let prefrences = WKPreferences()
        //设置网页界面的最小字号
        prefrences.minimumFontSize = 0
        
        //设置是支持JavaScrip 脚本 默认为 true
        if #available(iOS 14.0,  *) {
            //iOS13后新增的类,allowsContentJavaScript是iOS14后新增的方法。
            let webpagePreferences = WKWebpagePreferences()
            webpagePreferences.allowsContentJavaScript = true
            config.defaultWebpagePreferences = webpagePreferences
        } else {
            prefrences.javaScriptEnabled = true
        }
        //是否允许不经过用户交互由JavaScript自动打开窗口，默认为NO
        prefrences.javaScriptCanOpenWindowsAutomatically = true
        // 赋值设置对象
        config.preferences = prefrences
        //YES是使用h5的视频播放器在线播放，NO是使用原生播放器全屏播放，默认为NO
        config.allowsInlineMediaPlayback = true
        //设置是否允许画中画播放，默认为YES
        config.allowsPictureInPictureMediaPlayback = true
        //设置是否允许airPlay播放  默认允许
        config.allowsAirPlayForMediaPlayback = true
        //设置 视频,音频等需要手势才可以播放
        config.mediaTypesRequiringUserActionForPlayback = .all
        //设置请求的User-Agent信息中的应用程序名称 iOS9后可用
        config.applicationNameForUserAgent = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        
        //WKUserContentController：用于管理native和JavaScript交互
        
        //解决WKWebView内存不释放问题
        
        
        //适配字体大小
        let jsStr = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        //js注入
        let userScript = WKUserScript(source: jsStr, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        config.userContentController.addUserScript(userScript)
        
        
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

        self.view.addSubview(progressView)
        //添加进度观察者  为了实现顶部加载提示条
        if self.wkWebview != nil {
             self.wkWebview?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        }
                
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            let process = Float(self.wkWebview?.estimatedProgress ?? 0)
            progressView.progress = process
            print("---\(process)")
            if process == 1.0 {
                progressView.isHidden = true
            }
        }
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
    
    
    // MARK: -WebViewDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.progress = 0
        progressView.isHidden = false
        print("--didStartProvisionalNavigation--")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("canGoBack = \(webView.canGoBack) canGoForward = \(webView.canGoForward)")
    }
    
    
    // MARK: -处理JS调用Native方法的代理方法。通过message.name来区分。
    //app端接收web端数据(通过代理方法)
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //message.body 即为web端传送数据
        //转换message.body使用
        let actionName = message.name
        let params = message.body
        
        if actionName.count > 0 {
//            if actionName == "JStoOCNoParams" {
//
//            } else if actionName == "JStoOCWithParams" {
//
//            }
        }
    }
    
    
    
    //
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//
//    }
//
//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//
//    }
    
}
