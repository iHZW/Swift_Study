//
//  ThirdViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

let thirdCellId = "thirdCellId"
let cellHeight = 80
let headerHeight = 45

class ThirdViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    //懒加载数据源
    lazy var dataArray : NSMutableArray = {
        var tempArray = NSMutableArray.init()
        var sectinoOneArray = NSMutableArray.init()
        var sectionTwoArray = NSMutableArray.init()
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = self.dataArray.object(at: section) as! NSMutableArray
        let count = sectionArray.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: thirdCellId, for: indexPath) as! WFCommonCell
        let sectionArray = self.dataArray.object(at: indexPath.section) as! NSMutableArray
        let infoModel = sectionArray.object(at: indexPath.row) as! WFListInfoModel
        cell.cellInfoModel(infoModel: infoModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        WFLog("点击了第\(indexPath.row)名")
        
        let sectionArray = self.dataArray.object(at: indexPath.section) as! NSMutableArray
        let infoModel = sectionArray.object(at: indexPath.row) as! WFListInfoModel
        infoModel.attack(auto: true)
        infoModel.tabeOff(speed: 3000)
        infoModel.eat(something: "bread")
        infoModel.drink(something: "milk")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerName = "我是Header :\(section)"
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(kMainScreenWidth), height: headerHeight))
        headerView.backgroundColor = UIColor.lightGray
        let headerLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Int(kMainScreenWidth), height: headerHeight))
        headerLabel.text = headerName
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    

    open var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight), style: UITableView.Style.plain)
        self.tableView.register(WFCommonCell.classForCoder(), forCellReuseIdentifier: thirdCellId)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView.rowHeight = CGFloat(cellHeight)
        
        self.view.addSubview(self.tableView)
        
    }

}
