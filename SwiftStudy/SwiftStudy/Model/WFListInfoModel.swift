//
//  WFListInfoModel.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/9.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

/** 会飞 */
protocol playable {
    func tabeOff(speed: Int)
}

/** 攻击 */
protocol armed {
    func attack(auto: Bool)
}

protocol survival {
    func eat(something: String)
    func drink(something: String)
}

class WFListInfoModel: NSObject {
    var titleName : String
    var subTitleName : String
    var leftImageName : String
    var rightBtnName : String
    
    init(titleName: String, subTitleName:String, leftImageName: String, rightBtnName: String) {
        
        self.titleName = titleName
        self.subTitleName = subTitleName
        self.leftImageName = leftImageName
        self.rightBtnName = rightBtnName
    }
}


extension WFListInfoModel:playable, armed, survival {
    
    func tabeOff(speed: Int) {
        print("\(speed)")
    }
    
    func attack(auto: Bool) {
        if auto {
            print("开启自动攻击")
        }else {
            print("开启手动攻击")
        }
    }
    
    func eat(something: String) {
        print("吃: \(something)")
    }
    
    func drink(something: String) {
        print("th喝: \(something)")
    }
}
