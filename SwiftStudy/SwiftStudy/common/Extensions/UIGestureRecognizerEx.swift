//
//  UIGestureRecognizerEx.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/29.
//  Copyright © 2022 HZW. All rights reserved.
//

import UIKit

class UIGestureRecognizerEx: NSObject {

}

/**
 * UITapGestureRecognizer 的扩展类 给手势添加一个tag属性
 */
private var tagKey: Int?
extension UITapGestureRecognizer {
    var gestureTag: Int? {
        get {
            return objc_getAssociatedObject(self, &tagKey) as? Int
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tagKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
}
