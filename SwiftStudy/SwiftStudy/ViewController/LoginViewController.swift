//
//  LoginViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/21.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    var tag: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
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
