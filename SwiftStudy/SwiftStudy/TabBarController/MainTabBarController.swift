//
//  MainTabBarController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    open var titleArray = NSMutableArray.init(objects: "首页", "第二页", "第三页", "第四页", "我的")
    override func viewDidLoad() {
        super.viewDidLoad()

        addTabBarChildViewControl(childVC: ViewController(), title: titleArray.object(at: 0) as! NSString, imageName: "TabMenu_Home_Normal", selectImageName: "TabMenu_Home_Highlight", index: 0)
        
        addTabBarChildViewControl(childVC: SecondViewController(), title:titleArray.object(at: 1) as! NSString, imageName: "TabMenu_Finacing_Normal", selectImageName: "TabMenu_Finacing_Highlight", index: 1)

        addTabBarChildViewControl(childVC: ThirdViewController(), title: titleArray.object(at: 2) as! NSString, imageName: "TabMenu_MyStock_Normal", selectImageName: "TabMenu_MyStock_Highlight", index: 2)
        
        addTabBarChildViewControl(childVC: FourthViewController(), title: titleArray.object(at: 3) as! NSString, imageName: "TabMenu_Trade_Normal", selectImageName: "TabMenu_Trade_Highlight", index: 3)
        
        addTabBarChildViewControl(childVC: FifthViewController(), title: titleArray.object(at: 4) as! NSString, imageName: "TabMenu_Home_Normal", selectImageName: "TabMenu_Mine_Highlight", index: 4)
        //处理选中tabBar的字体颜色
        self.tabBar.tintColor = UIColor.red
    }
    
    //添加tabBarVC控制器
    private func addTabBarChildViewControl (childVC : UIViewController, title : NSString, imageName : NSString, selectImageName : NSString, index : Int) {

        //确保使用原图
        let tempSelectImage = UIImage(named:selectImageName as String)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let vcItem = UITabBarItem.init(title: title as String, image: UIImage.init(named: (imageName as String)), selectedImage: tempSelectImage)
        vcItem.tag = index
        childVC.tabBarItem = vcItem
        //BaseNavigationController 继承于 UINavigationController 的子类 主要处理push二级页面hidesBottomBarWhenPushed的显示问题
        let navigationVC = BaseNavigationController.init(rootViewController: childVC)
        addChild(navigationVC)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        WFLog("didSlectindex:\(item.tag)");
        
        
    }

}
