//
//  LoginViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/21.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import SnapKit

private let kLogLeftSpace = 40
private let kLeftViewWidth = 40
private let kLogViewheight = 40
private let kLogBetweenHeight = 40

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    let countNo: String = "18516638588"
    let password: String = "000000"
    var loginBtn: UIButton!
    var closeBtn: UIButton!
    
    lazy var titleLabel: UILabel! = {
        let label = WFCreateLabel(rect: .zero, title: "登录后继续操作", titleColor: .black, alignment: .center, font: PASFont(fontSize: 25))
         return label
     }()
    
    lazy var countLabel: UILabel! = {
       let label = WFCreateLabel(rect: .zero, title: "账号", titleColor: .black, alignment: .center, font: PASFont(fontSize: 15))
        label.textAlignment = .left
        return label
    }()
    
    lazy var pwdLabel: UILabel! = {
          let label = WFCreateLabel(rect: .zero, title: "密码", titleColor: .black, alignment: .center, font: PASFont(fontSize: 15))
        label.textAlignment = .left
           return label
       }()
  
    lazy var countTextField: UITextField! = {
        let textField = UITextField.init(frame: CGRect.zero)
        textField.placeholder = "请输入账号"
//        textField.borderStyle = .roundedRect
        textField.keyboardType = .numbersAndPunctuation //数字字母
//        textField.delegate = self as? UITextFieldDelegate
        return textField
    }()
    
    lazy var pwdTextField: UITextField! = {
        let textField = UITextField.init(frame: CGRect.zero)
//        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        textField.placeholder = "请输入密码"
//        textField.delegate = self as? UITextFieldDelegate
        return textField
    }()
  
    lazy private var topLineView: UIView! = {
       return WFCreateView(rect: CGRect.zero, bgColor: HexColor(hex: 0xEDEDED))
    }()
    
    lazy private var midLineView: UIView! = {
        return WFCreateView(rect: CGRect.zero, bgColor: HexColor(hex: 0xEDEDED))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.countLabel)
        self.view.addSubview(self.pwdLabel)
        self.view.addSubview(self.countTextField)
        self.view.addSubview(self.pwdTextField)
        
        self.view.addSubview(self.topLineView)
        self.view.addSubview(self.midLineView)
  
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(60)
//            make.size.equalTo(CGSize.init(width: 100, height: 60))
        }
        
        self.countLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLogLeftSpace)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(50)
            make.size.equalTo(CGSize.init(width: kLeftViewWidth, height: kLogViewheight))
        }
        
        self.countTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.countLabel.snp.right).offset(kContentSideHorizSpace)
            make.right.equalToSuperview().offset(-kLogLeftSpace)
            make.centerY.height.equalTo(self.countLabel)
        }
        
        self.topLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.countLabel.snp.bottom)
            make.left.equalTo(self.countLabel)
            make.right.equalTo(self.countTextField.snp.right)
            make.height.equalTo(0.5)
        }
        
        self.pwdLabel.snp.makeConstraints { (make) in
            make.left.size.equalTo(self.countLabel)
            make.top.equalTo(self.countLabel.snp.bottom).offset(kLogBetweenHeight)
        }

        self.pwdTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.pwdLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-kLogLeftSpace)
            make.centerY.height.equalTo(self.pwdLabel)
        }
        
        self.midLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pwdLabel.snp.bottom)
            make.left.equalTo(self.pwdLabel)
            make.right.equalTo(self.pwdTextField.snp.right)
            make.height.equalTo(0.5)
        }
        
        self.loginBtn = WFCreateButton(target: self, rect: .zero, title: "登录", titleColor: .white, selector: #selector(loginAction), event: .touchUpInside)
        self.loginBtn.backgroundColor = HexColor(hex: 0xE2233E)
        self.loginBtn.layer.cornerRadius = 4
        self.view.addSubview(self.loginBtn)

        self.loginBtn?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(kLogLeftSpace)
            make.right.equalToSuperview().offset(-kLogLeftSpace)
            make.top.equalTo(self.pwdLabel.snp.bottom).offset(kLogBetweenHeight)
            make.height.equalTo(50)
        })
        
        self.closeBtn = WFCreateButton(target: self, rect: .zero, title: "", titleColor: .gray, selector: #selector(closePage), event: .touchUpInside)
        self.closeBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        self.closeBtn.setImage(UIImage.init(named: "login_close"), for: UIControl.State.normal)
        self.closeBtn.layer.cornerRadius = 4
        self.view.addSubview(self.closeBtn)
        self.closeBtn.snp.makeConstraints { (make) in
            make.center.equalTo(CGPoint.init(x: 60, y: 60))
            make.size.equalTo(CGSize.init(width: 60, height: 50))
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // 处理登录逻辑
    @objc func loginAction() {
        
        if self.countTextField.text?.validString() == true {
            
        }else if self.pwdTextField.text?.validString() == true {
            
        }else{
            if (self.countTextField.text == self.countNo &&
                self.pwdTextField.text == self.password) {
                self.dismiss(animated: true, completion: nil)
            }else{
                
            }
        }
    }
    
    @objc func closePage() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: -- UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
