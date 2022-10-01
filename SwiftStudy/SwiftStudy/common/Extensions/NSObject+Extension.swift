//
//  NSObject+Extension.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/30.
//  Copyright © 2022 HZW. All rights reserved.
//

import UIKit
import Foundation

extension NSObject{

    /// 获取类的属性列表
    ///
    /// - Returns:  属性名列表
    func get_class_copyPropertyList()->[String]{
        var outCount:UInt32 = 0
        let propers:UnsafeMutablePointer<objc_property_t>! =  class_copyPropertyList(self.classForCoder, &outCount)
        let count:Int = Int(outCount);
        var names:[String] = [String]()
        for i in 0...(count-1) {
            let aPro: objc_property_t = propers[i]
            if let proName:String = String(utf8String: property_getName(aPro)){
                names.append(proName)
            }
        }
        return names
    }
    
    /// 获取类的方法列表
    ///
    /// - Returns: 方法名列表
    func get_class_copyMethodList() -> [String]{
        var outCount:UInt32
        outCount = 0
        let methods:UnsafeMutablePointer<objc_property_t>! =  class_copyMethodList(self.classForCoder, &outCount)
        let count:Int = Int(outCount);
        var names:[String] = [String]()
        for i in 0...(count-1) {
            
            let aMet: objc_property_t = methods[i]
            
            if let methodName:String = String(utf8String: property_getName(aMet)){
                names.append(methodName)
            }
        }
        return names
    }
    
    
    func setValue(value:Any?, forUndefinedKey: String) {
        return
    }
//
    
    

}

