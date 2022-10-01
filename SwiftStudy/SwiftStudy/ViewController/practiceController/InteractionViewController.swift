//
//  InteractionViewController.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/29.
//  Copyright © 2022 HZW. All rights reserved.
//
/*
 UI控件与逻辑交互
 1: UISlider //滑块
 2: UIActivityIndicatorView //风火轮   loading
 3: UIProgressView // 进度条 指示器
 4: UIStepper //  [-|+]
 5: UIPickerView //选择器控件 .. 日期等
 6: UIDatePicker // 时间选择器
 7: UISearchBar //搜索栏控件
 */
import UIKit

protocol InteractionViewControllerProtocol {
    func sendData(data:String)
}

class InteractionViewController: BaseViewController {
    
    var label:UILabel = UILabel()
    var data:String?
    //代理反向传值
    var delegate: InteractionViewControllerProtocol?
    //闭包
    var closure:((String)->Void)?
    typealias MyBlock = (_ data:String) -> Void
    var closureBlock: MyBlock?
    //加载试图时调用的方法
    override func loadView() {
        super.loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    init(data: String, block: @escaping MyBlock) {
        self.data = data
        closureBlock = block
        super.init(nibName: nil, bundle: nil)
    }
    
    //试图加载完成时调用的方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createNav()
        label = UILabel()
            .frame(CGRect(x: 20, y: 100, width: kMainScreenWidth - 20*2, height: 100))
            .text("23")
            .color(UIColor.randomColor)
            .backgroundColor(.randomColor)
        label.text = self.data
        self.view.addSubview(label)
    }
    //将要布局子视图时调用的方法
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    //已经布局子视图时调用的方法
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    //界面将要展现时调用的方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //界面已经展现时调用的方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //界面将要消失时调用的方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    //界面已经消失时调用的方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.sendData(data: "第二个界面传参")
        if (self.closure != nil) {
            self.closure!("第二个界面传参")
        }
        
        if closureBlock != nil {
            closureBlock!("第二个界面传参")
        }
    }
    //析构方法
    deinit {
        print("deinit")
    }
    //收到内存警告时调用的方法
    override func didReceiveMemoryWarning() {
        print("内存告警")
    }
    
    
    // MARK: -nav
    func createNav() {
        //创建导航信息
        let barItem = UIBarButtonItem(image: UIImage(named: "AppIcon"), style: .plain, target: self, action: #selector(leftActoin))
        let tempItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(leftActoin))
        let tempItem1 = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(leftActoin))
        
        self.navigationItem.leftBarButtonItem = barItem
    }
    
    @objc func leftActoin() {
        print("leftActoin")
        self.navigationController?.popViewController(animated: true)
    }
}
