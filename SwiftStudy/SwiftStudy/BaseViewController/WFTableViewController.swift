//
//  WFTableViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/22.
//  Copyright © 2020 HZW. All rights reserved.
//
// 一个tableView的基类

import UIKit
import SnapKit

// 默认的cell重用标签
let pasDefaultCellIdentifier: String = "pasDefaultCellIdentifier"

class WFTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var style: UITableView.Style? = .plain
    
    var heightForHeader: CGFloat = 0
    
    // 学习使用
    func tempCellClass<T: UITableViewCell>(_ aClass: T.Type) {
        WFLog("class = \(aClass)")
        self.cellClass = aClass
    }
    
    var _cellClass: AnyClass!
    var cellClass: AnyClass! {
        set{
            _cellClass = newValue
            // MARK: -- 防止 cellCalss 在iewDidLoad()之后设置, 导致crash
            self.tableView.register(cellClass, forCellReuseIdentifier: pasDefaultCellIdentifier)
        }get{
            if _cellClass == nil {
                _cellClass = UITableViewCell.classForCoder()
            }
            return _cellClass
        }
    }
        
    var cellHeight: CGFloat! = 50
    //设置cell内容
    typealias CellConfigBlock = (_ tableVie: UITableView, _ indexPath: IndexPath, _ cell: Any?) -> Void
    var cellConfigBlock: CellConfigBlock?
    
    //设置cell点击事件
    typealias CellClickBlock = ((_ tableVie: UITableView, _ indexPath: IndexPath, _ cell: Any?) -> (Void))
    var cellClickBlock: CellClickBlock?
        
    lazy var tableView: WFBaseTableView! = {
        let tempView = WFBaseTableView.init(frame: CGRect.zero, style: self.style!)
        tempView.delegate = self
        tempView.dataSource = self
        //ios11默认开启 Self-Sizing
        tempView.estimatedRowHeight = 0
        tempView.estimatedSectionHeaderHeight = 0
        tempView.estimatedSectionFooterHeight = 0
        
        tempView.backgroundColor = UIColor.clear
        tempView.showsVerticalScrollIndicator = false
        tempView.register(self.cellClass, forCellReuseIdentifier: pasDefaultCellIdentifier)
        return tempView
    }()
    
    //数据源
    var dataArray: NSMutableArray = NSMutableArray.init()
    var numberSections: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview().priority(ConstraintPriority.low)
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        var sectionNo = 1
        if numberSections > 0 {
            sectionNo = numberSections
        }
        else if dataArray.count > 0 {
            sectionNo = dataArray.count
        }
        return sectionNo
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        var number = dataArray.count
        if ((dataArray[section] as? NSArray) != nil) {
            number = (dataArray[section] as? NSArray)?.count as! Int
        }
        return number
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: pasDefaultCellIdentifier, for: indexPath)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        //加载子类cell的内容
        cellConfigBlock?(tableView, indexPath, cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
            
        cellClickBlock?(tableView, indexPath, cell)        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = WFCreateView(rect: CGRect.zero, bgColor: .blue)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat = 0
        if self.style == UITableView.Style.grouped {
            height = 0.01
        }
        if section > 0 {
            height = heightForHeader
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height: CGFloat = 0
        if self.style == UITableView.Style.grouped {
            height = 0.01
        }
        return height
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
