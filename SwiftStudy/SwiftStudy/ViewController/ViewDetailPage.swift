//
//  ViewDetailPage.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/8.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class ViewDetailPage: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页详情页"
        
        let nextBtn = createBtn(rect: CGRect.init(x: 20, y: 100, width: kMainScreenWidth - 20*2, height: 200), title: "跳转到第三页根控制器", titleColor: UIColor.blue, selector: #selector(nextAction))
       
        let popBtn = createBtn(rect: CGRect.init(x: 20, y: 400, width: kMainScreenWidth - 20*2, height: 200), title: "返回", titleColor: UIColor.blue, selector: #selector(popAction))

        self.view.addSubview(nextBtn)
        self.view.addSubview(popBtn)
//        let
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
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
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func popAction() {
        self.navigationController?.popViewController(animated: true)
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
