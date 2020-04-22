//
//  FourthViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

class FourthViewController: BaseViewController {

    private var myStudent: Student?
    
    private var titleArray: [String] = ["普吉岛","夏威夷","洛杉矶","杭州","长城"]
    
//    private var testCtrl = TestWFTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(self.segmentView)
    }
    
    lazy var segmentView: CenterSegmentView = {
        let vc1 = SimpleWFTableViewController()
        vc1.view.frame = CGRect.init(x: 0, y: -kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kMainTabBarHeight)
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = ViewDetailPage()
        let vc5 = FifthViewController()
        let controllers = [vc1, vc2, vc3, vc4, vc5]
        
        let segmentView = CenterSegmentView.init(frame: CGRect.init(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight - kMainTabBarHeight), normalFont: PASFont(fontSize: 10), selectFont: PASFont(fontSize: 15), normalColor: HexColor(hex: 0x111111), selectColor: HexColor(hex: 0xE2233E), controllers: controllers, titleArray: self.titleArray, selectIndex: 0)
        
        //闭包回调
        if (segmentView.pageBlock != nil) {
            segmentView.pageBlock = {
                (index) in
                WFLog("index = \(index)")
            }
        }
        return segmentView
    }()
}
