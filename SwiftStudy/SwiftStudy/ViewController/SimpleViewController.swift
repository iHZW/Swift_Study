//
//  SimpleViewController.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/28.
//  Copyright © 2022 HZW. All rights reserved.
//

private let SimpleCellId = "SimpleCellId"

import UIKit

class SimpleViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tempView = UITableView(frame: CGRect(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight), style: .plain)
        tempView.register(SimpleCell.classForCoder(), forCellReuseIdentifier: SimpleCellId)
        tempView.delegate = self
        tempView.dataSource = self
        return tempView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 20, y: kSafeAreaTopStatusNavBarHeight + 30, width: 200, height: 30))
        label.text = "我是一个及普通的便签空间"
        self.view.addSubview(label)
        
        
        let label2 = UILabel(frame: CGRect(x: 20, y: CGRectGetMaxX(label.frame), width: 300, height: 60))
       
        self.view.addSubview(label2)
        let attri = NSMutableAttributedString(string: "我是个性化文本")
        attri.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.red], range: NSRange(location: 0, length: 2))
        attri.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], range: NSRange(location: 2, length: 3))
    
        label2.attributedText = attri
        
        self.view.addSubview(self.tableView)
    }
    
    //系统内存警告⚠️时被调用
    override func didReceiveMemoryWarning() {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleCellId) as! SimpleCell
        cell.setTitle(title: "我是简单")
        cell.setBtnName(name: "打她")
        cell.setImageName(imageName: "location")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(PageViewController(), animated: true)
    }
    
    
}
