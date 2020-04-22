//
//  SimpleWFTableViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/23.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class SimpleWFTableViewController: WFTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0...19 {
            let temp: String = "我是: \(index)号"
            self.dataArray.add(temp)
        }
        self.numberSections = 1
        self.cellHeight = 80
        self.view.backgroundColor = UIColor.white
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(kPORTRAIT_SAFE_AREA_BOTTOM_SPACE + kMainTabBarHeight))
        }

        if (self.cellConfigBlock != nil) {
            self.cellConfigBlock = {
                (tableView, indexPatch, cell) in
                let tempCell = (cell as! UITableViewCell)
                tempCell.textLabel?.text = self.dataArray.object(at: indexPatch.row) as? String
            }
        }

        
        if (self.cellClickBlock != nil) {
            self.cellClickBlock = {
                (tableView, indexPatch, cell) in
                
                WFLog("tableView = \(tableView)\n indexPatch = \(indexPatch.row)")
            }
            
        }
        
        
        
        // Do any additional setup after loading the view.
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