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
        
        // Do any additional setup after loading the view.
    }


}

