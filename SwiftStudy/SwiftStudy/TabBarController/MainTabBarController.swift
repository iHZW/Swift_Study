//
//  MainTabBarController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    //实现单利 methodOne
    static let sharedInstance = MainTabBarController()

    //实现单利 methodTwo
    class var sharedInstanceTwo: MainTabBarController {
        struct Static{
            static let instance: MainTabBarController = MainTabBarController()
        }
        return Static.instance
    }
    
    //实现单利 methodThree  dispatch_once_t 方法已经废弃
//    class var sharedInstanceThree: MainTabBarController {
//        struct Static{
//            static var onceTken: dispatch_once_t  = 0
//            static var instance: MainTabBarController? = nil
//        }
//
//        dispatch_once(&Static.onceTken){
//            Static.instance = MainTabBarController()
//        }
//        return Static.instance!
//    }
    
    private var navCtrlArray: NSMutableArray? = NSMutableArray.init()
    
    //MARK: --setter getter
    var _lastSelectedIndex: NSInteger!
    var lastSelectedIndex: NSInteger {
        if _lastSelectedIndex == nil {
            _lastSelectedIndex = NSInteger()
            //判断是否相等,不同才设置
            if (self.selectedIndex != selectedIndex) {
                //设置最近一次
                _lastSelectedIndex = self.selectedIndex;
            }
            //调用父类的setSelectedIndex
            super.selectedIndex = selectedIndex
        }
        return _lastSelectedIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllerArray: [UIViewController] = [ViewController(), SecondViewController(), ThirdViewController(), FourthViewController(), FifthViewController(),ViewController(), SecondViewController(), ThirdViewController(), FourthViewController(), FifthViewController()]
        let normalImageArray: [String] = ["TabMenu_Home_Normal", "TabMenu_Finacing_Normal", "TabMenu_MyStock_Normal", "TabMenu_Trade_Normal", "TabMenu_Home_Normal","TabMenu_Home_Normal", "TabMenu_Finacing_Normal", "TabMenu_MyStock_Normal", "TabMenu_Trade_Normal", "TabMenu_Home_Normal"]
        let selectImageArray: [String] = ["TabMenu_Home_Highlight", "TabMenu_Finacing_Highlight", "TabMenu_MyStock_Highlight", "TabMenu_Trade_Highlight", "TabMenu_Mine_Highlight","TabMenu_Home_Highlight", "TabMenu_Finacing_Highlight", "TabMenu_MyStock_Highlight", "TabMenu_Trade_Highlight", "TabMenu_Mine_Highlight"]
        let titleArray: [String] = ["首页", "第二页", "第三页", "第四页", "我的","首页", "第二页", "第三页", "第四页", "我的"]

        var currentIndex: Int = 0
        for _ in controllerArray {
            
            addTabBarChildViewControl(childVC: controllerArray[currentIndex], title: titleArray[currentIndex], imageName: normalImageArray[currentIndex], selectImageName: selectImageArray[currentIndex], index: currentIndex)
            
            currentIndex += 1
        }

        //处理选中tabBar的字体颜色
        self.tabBar.tintColor = UIColor.red
        
        self.viewControllers = self.navCtrlArray! as? [UIViewController]
    }
    
    //添加tabBarVC控制器
    private func addTabBarChildViewControl (childVC : UIViewController, title : String, imageName : String, selectImageName : String, index : Int) {

        //确保使用原图
        let tempSelectImage = UIImage(named:selectImageName as String)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let vcItem = UITabBarItem.init(title: title as String, image: UIImage.init(named: (imageName as String)), selectedImage: tempSelectImage)
        vcItem.tag = index
        childVC.tabBarItem = vcItem
        //BaseNavigationController 继承于 UINavigationController 的子类 主要处理push二级页面hidesBottomBarWhenPushed的显示问题
        let navigationVC = BaseNavigationController.init(rootViewController: childVC)
        navCtrlArray?.add(navigationVC)
        addChild(navigationVC)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        WFLog("didSlectindex:\(item.tag)");
        
        //获取选中的item
        let tabIndex = tabBar.items?.firstIndex(of: item)
        if tabIndex != self.selectedIndex {
            //设置最近一次变更
            _lastSelectedIndex = self.selectedIndex
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //这个里可以处理如果不需要选中item的话,return false
        
        return true
    }

}
