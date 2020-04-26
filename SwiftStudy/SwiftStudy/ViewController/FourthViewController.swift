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
    
    private var titleArray: [String] = ["普吉岛","夏威夷","洛杉矶","杭州","长城", "英格兰","长城"]
    
//    private var testCtrl = TestWFTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.segmentView)
    }
    
    lazy var segmentView: CenterSegmentView = {
        let vc1 = SimpleWFTableViewController()
        let vc2 = HawaiiViewController()
        let vc3 = SimpleWFTableViewController()
        let vc4 = ViewDetailPage()
        let vc5 = FifthViewController()
        let vc6 = SimpleWFTableViewController()
        let vc7 = SimpleWFTableViewController()

        let controllers = [vc1, vc2, vc3, vc4, vc5, vc6, vc7]
        
        let origin_Y: CGFloat = kSafeAreaTopStatusNavBarHeight
        let segmentHeight = (kMainSCreenHeight - origin_Y - kMainTabBarHeight - kPORTRAIT_SAFE_AREA_BOTTOM_SPACE)
        let segmentView = CenterSegmentView.init(frame: CGRect.init(x: 0, y: origin_Y, width: kMainScreenWidth, height: segmentHeight), controllers: controllers, titleArray: self.titleArray, itemWidth: 80, isAccordingFive: true)
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
