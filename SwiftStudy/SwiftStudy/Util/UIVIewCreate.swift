//
//  UIVIewCreate.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/9.
//  Copyright © 2020 HZW. All rights reserved.
//

//这个类存放一些view的初始化方法

import UIKit

class UIVIewCreate: NSObject {

    
}

//创建一个button
public func WFCreateButton(target: Any?, rect: CGRect, title: String,  titleColor: UIColor, selector: Selector, event: UIControl.Event) -> UIButton {
    let tempBtn = UIButton.init(type: UIButton.ButtonType.custom)
    tempBtn.frame = rect
    tempBtn.setTitle(title, for: UIControl.State.normal)
    tempBtn.setTitleColor(titleColor, for: UIControl.State.normal)
    tempBtn.addTarget(target, action: selector, for: event)
    return tempBtn
}

public func WFCreateLabel(rect: CGRect, title: String, titleColor: UIColor, alignment: NSTextAlignment, font: UIFont) -> UILabel {
    let label = UILabel.init(frame: rect)
    if !title.isEmpty {
        label.text = title
    }
        
    label.textColor = titleColor
    
    if alignment.rawValue > 0 {
        label.textAlignment = alignment
    }
    label.font = font
    label.adjustsFontSizeToFitWidth = true  //默认自动缩放
    return label
}


public func WFCreateImageView(rect: CGRect, imageName: String) -> UIImageView {
    let imageView = UIImageView.init(frame: rect)
    if !imageName.isEmpty {
        imageView.image = UIImage.init(named: imageName)
    }
    return imageView
}


public func WFCreateView(rect: CGRect, bgColor: UIColor) -> UIView {
    let view = UIView.init(frame: rect)
    view.backgroundColor = bgColor
    return view
}


// MARK: -- 创建UITextField
public func WFCreateTextField(rect: CGRect = CGRect.zero,
                              placeholder: String? = "",
                              borderStyle: UITextField.BorderStyle = .none,
                              keyboardType: UIKeyboardType = .`default`,
                              clearButtonMode: UITextField.ViewMode = .never) -> UITextField {
    let textField = UITextField.init(frame: rect)
    textField.placeholder = placeholder
    textField.borderStyle = borderStyle
    textField.keyboardType = keyboardType
    textField.clearButtonMode = clearButtonMode
    return textField
}
