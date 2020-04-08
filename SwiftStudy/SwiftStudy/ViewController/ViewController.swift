//
//  ViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    open var myLabel: UILabel!
    open var dataArray : NSMutableArray?
    open var currentIndx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.title = self.navigationController?.tabBarItem.title
        
        let tempLabel = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 200))
        tempLabel.text = "我是Label"
        tempLabel.backgroundColor = UIColor.gray
        tempLabel.textColor = UIColor.red
        tempLabel.font = UIFont.systemFont(ofSize: 50)
        tempLabel.textAlignment = NSTextAlignment.center;
        tempLabel.adjustsFontSizeToFitWidth = true
        self.myLabel = tempLabel;
        self.view.addSubview(self.myLabel)
        
        let nextBtn = UIButton.init(frame: CGRect.init(x: 100, y: 300, width: 200, height: 100))
        nextBtn.setTitle("下一页", for: UIControl.State.normal)
        nextBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        nextBtn.addTarget(self, action: #selector(nextActon), for: UIControl.Event.touchUpInside)
        self.view.addSubview(nextBtn)
        
        let tempBtn = UIButton.init(frame: CGRect.init(x: 100, y: 400, width: 200, height: 200))
        tempBtn.backgroundColor = UIColor.green
        tempBtn.setTitle("我是Btn", for: UIButton.State.normal)
        tempBtn.setTitleColor(UIColor.black, for: UIButton.State.normal)
        tempBtn.titleLabel?.textAlignment = NSTextAlignment.center
        tempBtn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(tempBtn)
        
        dataArray = NSMutableArray.init(objects: "小明", "小红", "小兰", "小白", "小黑")
        // Do any additional setup after loading the view.
    }
    
    @objc func btnAction () {
        self.currentIndx += 1
        var remindString = "我被袭击了"
        if self.currentIndx >= self.dataArray!.count {
            self.currentIndx = 0
        }else{
            remindString = self.dataArray?.object(at: self.currentIndx) as! String
        }
        self.myLabel.text = remindString
    }
    
    
    @objc func nextActon () {
        
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }


}

