//
//  ViewDetailPage.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/8.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class ViewDetailPage: BaseViewController {

    open var transName: String!
    private var transLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页详情页"
        
        let nextBtn = createBtn(rect: CGRect.init(x: 20, y: 100, width: kMainScreenWidth - 20*2, height: 100), title: "跳转到第三页根控制器", titleColor: UIColor.blue, selector: #selector(nextAction))
            
        let tempBtn = WFCreateButton(target: self, rect: CGRect.init(x: 20, y: 250, width: kMainScreenWidth - 20*2, height: 100), title: "工厂方式创建的Button", titleColor: UIColor.red, selector: #selector(wfAction), event: UIControl.Event.touchUpInside)
        let popBtn = createBtn(rect: CGRect.init(x: 20, y: 400, width: kMainScreenWidth - 20*2, height: 100), title: "返回", titleColor: UIColor.blue, selector: #selector(popAction))

        self.view.addSubview(nextBtn)
        self.view.addSubview(popBtn)
        self.view.addSubview(tempBtn)
        
        self.transLabel = WFCreateLabel(rect: CGRect.zero, title: self.transName ?? "Hello Word", titleColor: UIColor.blue, alignment: .center, font: .systemFont(ofSize: 20))
        self.view.addSubview(self.transLabel!)
        
        self.transLabel?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
            make.bottom.equalToSuperview().offset(-150)
        })
        
    }
    //测试数组排序
    let names = ["A", "BB", "AC", "ABC", "B", "C", "AA"]
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //测试数组排序
        let reversed = names.sorted(by: backwards(s1:s2:))
        WFLog("names = \(names) \n reversed = \(reversed)")
        
        
        let tempVC = UIViewController.current()
        let tempNav = kCurrentNavigationController()
        
        tempNav.tabBarController?.selectedIndex = 3
        
        self.dismiss(animated: true, completion: nil)
    }
    //降序排列
    func backwards (s1: String, s2: String) -> Bool{
        return s1 > s2 ? true : false
    }

    
    //创建btn
    func createBtn(rect: CGRect, title: String,  titleColor: UIColor, selector: Selector) -> UIButton {
        let tempBtn = UIButton.init(type: UIButton.ButtonType.custom)
        tempBtn.frame = rect
        tempBtn.setTitle(title, for: UIControl.State.normal)
        tempBtn.setTitleColor(titleColor, for: UIControl.State.normal)
        tempBtn.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
        return tempBtn
    }
    
    //实现跳转到第三页根控制器
    @objc func nextAction() {
        self.navigationController?.tabBarController?.selectedIndex = 2
//        if (self.navigationController?.children.count)! > 0 {
//            self.navigationController?.popToRootViewController(animated: true)
//        }else{
//            self.navigationController?.tabBarController?.selectedIndex = 1
//        }
        
        if self.navigationController != nil {
            self.navigationController?.tabBarController?.selectedIndex = 2
            self.navigationController?.popViewController(animated: true)
        }else{
//            let currentNav = self.currentNavViewController()
//            currentNav?.tabBarController?.selectedIndex = 2
            let currentVC = UIViewController.current()
//            currentVC.navigationController?.tabBarController?.selectedIndex = 2
            kCurrentNavigationController().tabBarController?.selectedIndex = 2
        }
    }
    
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func wfAction(button: UIButton) {
        WFLog("点击了: \(String(describing: button.titleLabel?.text))")
    }
    
    
    ///获取当前视图所在导航控制器
    func currentNavViewController() -> UINavigationController? {
        var n = next
        while n != nil {
            if n is UINavigationController {
                return n as? UINavigationController
            }
            n = n?.next
        }
        return nil
    }
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
