//
//  WFNavigation.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/21.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

func kCurrentNavigationController () -> UINavigationController {
    ///获取当前视图所在导航控制器
    let vc = UIViewController.current()
    return vc.navigationController ?? UINavigationController.init()
}

extension UIViewController {
    
    /** 获取当前控制器 */
    static func current() -> UIViewController {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        return UIViewController.findBest(vc: vc!)
    }
    
    private static func findBest(vc: UIViewController) -> UIViewController {
        if vc.presentedViewController != nil {
            return UIViewController.findBest(vc: vc.presentedViewController!)
        } else if vc.isKind(of: UISplitViewController.self) {
            let svc = vc as! UISplitViewController
            if svc.viewControllers.count > 0 {
                return UIViewController.findBest(vc: svc.viewControllers.last!)
            } else {
                return vc
            }
        } else if vc.isKind(of: UINavigationController.self) {
            let svc = vc as! UINavigationController
            if svc.viewControllers.count > 0 {
                return UIViewController.findBest(vc: svc.topViewController!)
            } else {
                return vc
            }
        } else if vc.isKind(of: UITabBarController.self) {
            let svc = vc as! UITabBarController
            if (svc.viewControllers?.count ?? 0) > 0 {
                return UIViewController.findBest(vc: svc.selectedViewController!)
            } else {
                return vc
            }
        } else {
            return vc
        }
    }
}


class WFNavigation: NSObject {

}
