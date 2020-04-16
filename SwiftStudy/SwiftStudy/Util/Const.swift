//
//  Const.swift
//  Swift_Study
//
//  Created by HZW on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

/**< 存放一些宏定义 */

import UIKit

public let kContentSideHorizSpace = CGFloat(15) //距屏幕左侧间距
public let kContentSideVertiSpace = CGFloat(10) //上下控件通用距离

public let kMainScreenWidth = UIScreen.main.bounds.size.width
public let kMainSCreenHeight = UIScreen.main.bounds.size.height
public let kMainTabbarHeight = CGFloat(49) //底部tabBar的高度
public let kMainNavHeight = CGFloat(44) // 系统导航栏高度
//系统状态栏高度
public let kSysStatuesBarHeight = min(UIApplication.shared.statusBarFrame.size.height, UIApplication.shared.statusBarFrame.size.width)
//状态栏+导航栏高度
public let kSafeAreaTopStatusNavBarHeight = (kMainNavHeight + kSysStatuesBarHeight)


// IPhoneX 竖屏安全区域顶部空白
public let kPORTRAIT_SAFE_AREA_TOP_SPACE = (IS_IPHONE_X() ? CGFloat(44) : 0)
// IPhoneX 竖屏安全区域底部空白
public let kPORTRAIT_SAFE_AREA_BOTTOM_SPACE = (IS_IPHONE_X() ? CGFloat(34) : 0)
// IPhoneX 横屏安全区域左部空白
public let kLANDSCAPE_SAFE_AREA_LEFT_SPACE = (IS_IPHONE_X() ? CGFloat(44) : 0)
// IPhoneX 横屏安全区域右部空白
public let kLANDSCAPE_SAFE_AREA_RIGHT_SPACE = (IS_IPHONE_X() ? CGFloat(44) : 0)
// IPhoneX 横屏安全区域底部空白
public let kLANDSCAPE_SAFE_AREA_BOTTOM_SPACE = (IS_IPHONE_X() ? CGFloat(21) : 0)


//判断是否是iphoneX系列的手机
func IS_IPHONE_X() ->Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height;
    if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}



/// log 封装
/// - Parameters:
///   - message: 打印信息
///   - file: 表示当前文件
///   - functionName: 功能名
///   - lineNumber: 表示当前行数
func WFLog<T>(_ message: T,
               file: String = #file,
               functionName: String = #function,
               lineNumber: Int = #line) {
    #if DEBUG
    let filename = (file as NSString).lastPathComponent
    print("\(filename): \(lineNumber)-\(message)")
    #endif
}

class Const: NSObject {
 
}
