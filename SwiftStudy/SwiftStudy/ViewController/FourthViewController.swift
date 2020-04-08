//
//  FourthViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit
import WebKit

class FourthViewController: BaseViewController {

    var wkWebView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化WKWebView
        self.wkWebView = WKWebView.init(frame: self.view.frame)
        //添加一个简单的html页面
        self.wkWebView?.load(URLRequest.init(url: NSURL.init(string: "https://www.baidu.com")! as URL))
        //加载本地html资源
//        self.wkWebView.load(URLRequest.init(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)))
        
        self.view.addSubview(self.wkWebView!)
        // Do any additional setup after loading the view.
    }
    
}
