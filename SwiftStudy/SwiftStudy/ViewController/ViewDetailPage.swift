//
//  ViewDetailPage.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/8.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import MCToast

class ViewDetailPage: BaseViewController {

    var tempPrint = CanPrintBase<String>()
    var currentIndex: Int = 0
    open var transName: String!
    private var transLabel: UILabel!
    private var mapBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页详情页"
        
        let nextBtn = createBtn(rect: CGRect.init(x: 20, y: 100, width: kMainScreenWidth - 20*2, height: 100), title: "跳转到第三页根控制器", titleColor: UIColor.blue, selector: #selector(nextAction))
            
        let tempBtn = WFCreateButton(target: self, rect: CGRect.init(x: 20, y: 250, width: kMainScreenWidth - 20*2, height: 100), title: "登录", titleColor: UIColor.red, selector: #selector(wfAction), event: UIControl.Event.touchUpInside)
        tempBtn.backgroundColor = HexColor(hex: 0xEDEDED)
        tempBtn.layer.cornerRadius = 4
        
        let popBtn = createBtn(rect: CGRect.init(x: 20, y: 400, width: kMainScreenWidth - 20*2, height: 100), title: "返回", titleColor: UIColor.blue, selector: #selector(popAction))

        self.view.addSubview(nextBtn)
        self.view.addSubview(popBtn)
        self.view.addSubview(tempBtn)
        
        let viewHeight = 60
        let leftSpace = 30
        
        nextBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(leftSpace)
            make.top.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-leftSpace)
            make.height.equalTo(viewHeight)
        }
        
        tempBtn.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nextBtn)
            make.top.equalTo(nextBtn.snp.bottom).offset(20)
        }
        
        popBtn.snp.makeConstraints { (make) in
            make.left.height.right.equalTo(nextBtn)
            make.top.equalTo(tempBtn.snp.bottom).offset(20)
        }
        
        self.transLabel = WFCreateLabel(rect: CGRect.zero, title: self.transName ?? "Hello Word", titleColor: UIColor.blue, alignment: .center, font: .systemFont(ofSize: 20))
        self.view.addSubview(self.transLabel!)
        
        self.transLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(popBtn.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        })
        
        self.mapBtn = WFCreateButton(target: self, rect: .zero, title: "go to Map", titleColor: .black, selector: #selector(gotoMapView), event: .touchUpInside)
        mapBtn.backgroundColor = .lightGray
        self.view.addSubview(self.mapBtn)
        
        self.mapBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalTo(60)
            make.top.equalTo(self.transLabel.snp.bottom).offset(5)
        }
        
    }
      
    // MARK: -- 跳转到地图界面
    @objc func gotoMapView() {
      
        let mapCtrl = TestMapViewController()
        kCurrentNavigationController().pushViewController(mapCtrl, animated: true)
    }
    
    //测试数组排序
    let names = ["A", "BB", "AC", "ABC", "B", "C", "AA"]
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //测试数组排序
//        let reversed = names.sorted(by: backwards(s1:s2:))
//        WFLog("names = \(names) \n reversed = \(reversed)")
//
//
//        let tempVC = UIViewController.current()
//        let tempNav = kCurrentNavigationController()
//
//        tempNav.tabBarController?.selectedIndex = 3
//
//        self.dismiss(animated: true, completion: nil)
//    }
    //降序排列
    func backwards(s1: String, s2: String) -> Bool{
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
//            let currentVC = UIViewController.current()
//            currentVC.navigationController?.tabBarController?.selectedIndex = 2
            let currentNav = kCurrentNavigationController()
            if currentNav.isKind(of: BaseNavigationController.self) {
                currentNav.tabBarController?.selectedIndex = 2
            }else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func popAction() {
        let currentNav = kCurrentNavigationController()
        if currentNav.isKind(of: BaseNavigationController.self) {
            currentNav.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
        
        var a = 1
        var b = 2
        self.swapTwoValues(a: &a, b: &b)
        WFLog("a = \(a)\n b = \(b) ")
        
        let tempValue = WFAdd(num1: 6.3, 7)
        let tempString = WFAdd(num1: "hello ", "word")
        let tempValue2 = WFMinus(num1: 3, 9)
//        let tempString2 = WFMinus(num1: "hello ", "word")
  
        WFLog("tempValue = \(tempValue)\n tempString = \(tempString)\n tempValue2 = \(tempValue2) \n")
        
        
        
        self.tempPrint.pop()
        WFLog("getCurrent = \(self.tempPrint.getCurrent() ?? "default")")
        
        MCToast.mc_failure("请输入账号")
        
    }
    
    @objc func wfAction(button: UIButton) {
        WFLog("点击了: \(String(describing: button.titleLabel?.text))")
        self.currentIndex += 1
        self.tempPrint.push(item: "\(self.currentIndex)")

        // MARK: - 默认全屏
        let loginCtrl = LoginViewController()
        loginCtrl.modalPresentationStyle = .overFullScreen
        self.present(loginCtrl, animated: true, completion: nil)
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
    
    // MARK: -- Swift 泛型使用
    func swapTwoValues<T>(a: inout T, b: inout T){
        let temppraryA = a
        a = b
        b = temppraryA
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



/// 实现一个堆栈
class CanPrintBase<T>: NSObject {
    var list:[T] = []
    
    //入栈
    func push(item: T){
        list.append(item)
    }
    //出栈
    func pop() {
        if list.count > 0 {
            list.removeLast()
        }
    }
}

extension CanPrintBase{
    func getCurrent() -> T?{
        return list.last
    }
}
