//
//  HawaiiViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/25.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit

class HawaiiViewController: WFTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tempCellClass(WFCommonCell.self)
        self.cellClass = WFCommonCell.classForCoder()
        self.cellHeight = 80
        self.heightForHeader = 45

        self.dataArray = {
            let tempArray = NSMutableArray.init()
            let sectinoOneArray = NSMutableArray.init()
            let sectionTwoArray = NSMutableArray.init()
            
            for index in 1...10 {
                let rightName = ((index % 2 == 0) ? "试试看" : "看好了")
                let leftIamgeName = ((index % 2 == 0) ? "headerImage0ne" : "headerImageTwo")
                let infoModel = WFListInfoModel.init(titleName: "第一组_\(index)排", subTitleName: "详情第\(index)", leftImageName: leftIamgeName, rightBtnName: rightName)
                sectinoOneArray.add(infoModel)
            }
            
            for index in 1...20 {
                let rightName = ((index % 2 == 0) ? "赶紧滚" : "OK")
                let leftIamgeName = ((index % 2 == 0) ? "headerImageTwo" : "headerImage0ne")
                let infoModel = WFListInfoModel.init(titleName: "第二组_\(index)排", subTitleName: "详情第\(index)", leftImageName: leftIamgeName, rightBtnName: rightName)
                sectionTwoArray.add(infoModel)
            }
            tempArray.addObjects(from: [sectinoOneArray, sectionTwoArray])
            return tempArray
        }()
        
        self.tableView.reloadData()
        
        if (self.cellConfigBlock != nil) {
            self.cellConfigBlock = {
                (tableView, indexPath, cell) in
                let tempCell = (cell as! WFCommonCell)
                let sectionArray = self.dataArray.object(at: indexPath.section) as! NSMutableArray
                let infoModel = sectionArray.object(at: indexPath.row) as! WFListInfoModel
                tempCell.cellInfoModel(infoModel: infoModel)
            }
        }
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
