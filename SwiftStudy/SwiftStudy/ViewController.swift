//
//  ViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/7.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        self.view.backgroundColor = UIColor.white
        
    
        let tempLabel = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 200))
        tempLabel.backgroundColor = UIColor.gray
        tempLabel.text = "Hello word !!!"
        tempLabel.textAlignment = NSTextAlignment.center
        tempLabel.textColor = UIColor.green
        
        self.view.addSubview(tempLabel)
        
        let tempBtn = UIButton.init(type: UIButton.ButtonType.custom)
        tempBtn.frame = CGRect.init(x: 100, y: 400, width: 200, height: 200)
        tempBtn.backgroundColor = UIColor.blue
        tempBtn.setTitle("点一下试试", for: UIControl.State.normal)
        tempBtn.titleLabel?.textAlignment = NSTextAlignment.center
        tempBtn.setTitleColor(UIColor.red, for: UIControl.State.normal)
        tempBtn.addTarget(self, action: #selector(btnDidClick), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(tempBtn)
        // Do any additional setup after loading the view.
    }

    
    @objc func btnDidClick() {
        print("试试就试试")
    }
}

