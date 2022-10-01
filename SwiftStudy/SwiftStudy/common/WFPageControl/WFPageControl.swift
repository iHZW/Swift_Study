//
//  WFPageControl.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/29.
//  Copyright © 2022 HZW. All rights reserved.
//

import UIKit

class WFPageControl: UIControl {

    var wf_numberOfPages = NSInteger() //分页数量
    var wf_currentPage = NSInteger() //当前点所在下标
    var wf_pointSzie = CGSize() //点大小
    var wf_otherColor = UIColor() //未选中点的颜色
    var wf_currentColor = UIColor() //选中点的颜色
    var wf_otherImage:UIImage? //未选中点的图片
    var wf_currentImage: UIImage? //选中点图片
    var wf_isSquare = Bool() //是否是方形点
    var wf_currentWithMultiple = CGPoint() //当前选中点宽度与未选中点的宽度的倍数

}
