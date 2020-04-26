//
//  SimpleWFTableViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/23.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class SimpleWFTableViewController: WFTableViewController {

    var defaultArray: NSMutableArray = NSMutableArray.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0...19 {
            let temp: String = "我是: \(index)号"
            self.dataArray.add(temp)
            self.defaultArray.add(temp)
        }
        self.numberSections = 1
        self.cellHeight = 80
        
        self.tableView.addPullToRefresh(animatorType: ESRefreshAnimatorType.meituan) {
            WFLog("下拉刷新")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.defaultArray = NSMutableArray.init(array: self.defaultArray)
                self.tableView.es.stopPullToRefresh()
                self.tableView.reloadData()
            }
        }
        
        self.tableView.addInfiniteScrolling(animatorType: ESRefreshAnimatorType.wechat) {
            WFLog("上拉加载")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                for index in 0...9 {
                    let temp: String = "我是: \(index)号"
                    self.dataArray.add(temp)
                }
                self.tableView.es.stopLoadingMore()
                self.tableView.reloadData()
            }
        }
        
        if (self.cellConfigBlock != nil) {
            self.cellConfigBlock = {
                (tableView, IndexPath, cell) in
                let tempCell = (cell as! UITableViewCell)
                tempCell.textLabel?.text = self.dataArray.object(at: IndexPath.row) as? String
            }
        }

        
        if (self.cellClickBlock != nil) {
            self.cellClickBlock = {
                (tableView, IndexPath, cell) in
                
                WFLog("tableView = \(tableView)\n indexPatch = \(IndexPath.row)")
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
