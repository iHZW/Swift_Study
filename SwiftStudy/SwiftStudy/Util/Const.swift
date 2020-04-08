//
//  Const.swift
//  Swift_Study
//
//  Created by HZW on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

/**< 存放一些宏定义 */

import UIKit

public let kMainScreenWidth = UIScreen.main.bounds.size.width
public let kMainSCreenHeight = UIScreen.main.bounds.size.height
public let kLeftSpace = 15 as CGFloat
public let kMainTabbarHeight = 49 //底部tabBar的高度
public let kMainNavHeight = 44 as CGFloat // 系统导航栏高度

//public let kMainTabbarHeight = 49

let IS_IPHONE_X =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)


class Const: NSObject {
 
}
