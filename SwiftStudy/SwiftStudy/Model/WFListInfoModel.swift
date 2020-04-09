//
//  WFListInfoModel.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/9.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

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
