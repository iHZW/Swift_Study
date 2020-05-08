//
//  LoginViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/21.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import SnapKit
import MCToast

private let kLogLeftSpace = 40
private let kLeftViewWidth = 40
private let kLogViewheight = 40
private let kLogBetweenHeight = 40

private let cellID: String = "logincellid"

class LoginViewController: BaseViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let countNo: String = "18516638588"
    let password: String = "000000"
    var loginBtn: UIButton!
    var closeBtn: UIButton!
    var tableView: WFBaseTableView!
    var headerView: UIView!
    
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
        textField.clearButtonMode = .always
        textField.keyboardType = .numbersAndPunctuation //数字字母
        return textField
    }()
    
    lazy var pwdTextField: UITextField! = {
        let textField = UITextField.init(frame: CGRect.zero)
//        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        textField.placeholder = "请输入密码"
        textField.clearButtonMode = .always
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
        
        //创建关闭按钮
        self.closeBtn = WFCreateButton(target: self, rect: .zero, title: "", titleColor: .gray, selector: #selector(closePage), event: .touchUpInside)
        self.closeBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        self.closeBtn.setImage(UIImage.init(named: "login_close"), for: UIControl.State.normal)
        self.closeBtn.layer.cornerRadius = 4
        self.view.addSubview(self.closeBtn)
        self.closeBtn.snp.makeConstraints { (make) in
            make.center.equalTo(CGPoint.init(x: 60, y: 60))
            make.size.equalTo(CGSize.init(width: 60, height: 50))
        }
        
        let headerHeight: CGFloat = CGFloat(60+50+(kLogViewheight+kLogBetweenHeight)*2+50+10)
        self.headerView = WFCreateView(rect: CGRect.init(x: 0, y: 0, width: kMainScreenWidth, height: headerHeight), bgColor: .clear)
        
        self.tableView = WFBaseTableView.init(frame: .zero, style: UITableView.Style.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableHeaderView = self.headerView
        self.tableView.tableFooterView = WFCreateView(rect: CGRect.zero, bgColor: .clear)
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        //tableView 拖动键盘消失
        self.tableView.keyboardDismissMode = .onDrag
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        self.headerView.addSubview(self.titleLabel)
        self.headerView.addSubview(self.countLabel)
        self.headerView.addSubview(self.pwdLabel)
        self.headerView.addSubview(self.countTextField)
        self.headerView.addSubview(self.pwdTextField)
        
        self.headerView.addSubview(self.topLineView)
        self.headerView.addSubview(self.midLineView)
  
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
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

        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        return cell
    }
    
    
    // 处理登录逻辑
    @objc func loginAction() {
        
        let numA: Int = 118 //0111 0110
        let numB: Int = 85  //0101 0101
        var numC: Int = 0
        
        numC = numA ^ numB
        WFLog("numC3 = \(numC)") //0010 0011, 35
        
        numC = ~numA
        WFLog("numC1 = \(numC)") //
        
        numC = numA << 2  //左移两位,即右侧直接补充两个0
        WFLog("numC2 = \(numC)") //0001 1101 1000
        
        numC = numA >> 2 //右移两位, 即右侧直接去掉两位
        WFLog("numC4 = \(numC)") // 0001 1101

        
        if self.countTextField.text?.validString() == true {
            MCToast.mc_failure("请输入账号")
        }else if self.pwdTextField.text?.validString() == true {
            MCToast.mc_other("请输入密码")
        }else{
            if (self.countTextField.text == self.countNo &&
                self.pwdTextField.text == self.password) {
                
                MCToast.mc_loading()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    MCToast.mc_success("登录成功")
                    self.closePage()
                }
            }else{
                MCToast.mc_text("密码不正确")
            }
        }
    }
    
    @objc func closePage() {
        // 重新指定跟控制器
        let rootVC = UIApplication.shared.delegate as! AppDelegate
        MainTabBarController.sharedInstance.selectedIndex = 4
        rootVC.window?.rootViewController = MainTabBarController.sharedInstance
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: -- UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    deinit {
        WFLog("LoginCtrl deadLine")
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
