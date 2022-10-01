//
//  WFAlertController.swift
//  SwiftStudy
//
//  Created by hzw on 2022/10/1.
//  Copyright © 2022 HZW. All rights reserved.
//

import UIKit

///可空的无参无返回值 Block
typealias AlertCompleteOptional = ((_ index: Int) -> Swift.Void)?
class WFAlertController: NSObject{
    //MARK: 链式初始化方法
    private var title: String?
    private var actionArray: [(String,UIAlertAction.Style,AlertCompleteOptional)] = []
    
    init(title: String?) {
        self.title = title
    }
    
    /// 类方法初始化链式
    @objc class func alertSheet(title: String?) -> WFAlertController{
        return WFAlertController(title: title)
    }
    
    @discardableResult
    @objc func add(title: String, style: UIAlertAction.Style, complete: AlertCompleteOptional) -> WFAlertController{
        actionArray.append((title,style,complete))
        return self
    }
    
    @objc func finish() ->UIAlertController{
        return WFAlertController.alertControllerSheet(title: self.title, actionArray: self.actionArray)
    }
    
    /// 使用actionSheet样式的系统AlertControllerSheet封装
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - hitSender: 当为ipad设备时给予一个附着的控件
    ///   - actionArray: 每个action独立元组数组
    /// - Returns: 返回这个alertController用于显示出来
    private class func alertControllerSheet(title: String?,
                                            actionArray: [(String,UIAlertAction.Style,AlertCompleteOptional)]) -> UIAlertController{
        
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        var i = 0
        for action in actionArray{
            let alertAction = UIAlertAction(title: action.0, style: action.1, handler: { (_) in
                action.2?(i)
            })
            alertVC.addAction(alertAction)
            i += 1
        }
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }
    
    
    //MARK: 类方法
    /// 返回alertController 有取消和确定按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - okTitle: 确定按钮的文字
    ///   - okComplete: 回调事件
    /// - Returns: alertController 实例
    @objc class func alertAlert(title: String?, message: String?, okTitle: String, cancelTitle: String? = nil, okComplete: AlertCompleteOptional) -> UIAlertController{
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: okTitle, style: .default, handler: { (_) in
            if okComplete != nil{
                okComplete!(1)
            }
        })
        
        let cancel = UIAlertAction(title: cancelTitle ?? "取消", style: .cancel) { (alert: UIAlertAction) -> Void in
            if okComplete != nil{
                okComplete!(0)
            }
        }
        
        alertVC.addAction(alertAction)
        alertVC.addAction(cancel)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }
    
    /// 返回alertController 仅确定按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - okTitle: 确定按钮的文字
    ///   - okComplete: 回调事件
    /// - Returns: alertController 实例
    @objc class func alertAlert(title: String?, message: String?, okTitle: String, okComplete: AlertCompleteOptional) -> UIAlertController{
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: okTitle, style: .default, handler: { (_) in
            if okComplete != nil{
                okComplete!(1)
            }
        })
        alertVC.addAction(alertAction)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }
    
    
    /// 多个输入框的alertController
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - placeholders: 多少个提示文字 代表多少个框
    ///   - okComplete: 回调字符串数组 数组内容顺序是输入框的顺序
    public class func alertInputViews(title: String?,
                                      message: String?,
                                      placeholders: [String]?,
                                      okComplete: @escaping ((_ text: [String]) -> Void)) -> UIAlertController{
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if let placeholderList = placeholders{
            for placeholder in placeholderList{
                alertVC.addTextField { (textField) in
                    textField.placeholder = placeholder
                }
            }
        }
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { (action) in
            if let textFields = alertVC.textFields{
                var inputText: [String] = []
                for textfield in textFields{
                    if let text = textfield.text{
                        inputText.append(text)
                    }
                }
                okComplete(inputText)
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel) { (action) in
        }
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }
    
    /// 适配iPad
    private class func addPopPresenterView(alertVC: UIAlertController){
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            let popPresenter = alertVC.popoverPresentationController
            if let keywindow = UIApplication.shared.keyWindow{
                popPresenter?.sourceView = keywindow
                if alertVC.preferredStyle == UIAlertController.Style.alert {
                    popPresenter?.sourceRect = CGRect(x: keywindow.width/2, y:keywindow.height/2, width: 0, height: 0)
                }else {
                    popPresenter?.sourceRect = CGRect(x: keywindow.width/2, y: keywindow.height, width: 0, height: 0)
                }
                popPresenter?.permittedArrowDirections = []
            }
        }
    }

}
