//
//  ThirdViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

let thirdCellId = "thirdCellId"
let cellHeight = 60

class ThirdViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 20
        if section == 0 {
            count = 10
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: thirdCellId, for: indexPath)
        cell.textLabel?.text = "第三页第\(indexPath.row)名"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\(indexPath.row)名")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerName = "我是Header :\(section)"
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(kMainScreenWidth), height: cellHeight))
        headerView.backgroundColor = UIColor.gray
        let headerLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Int(kMainScreenWidth), height: cellHeight))
        headerLabel.text = headerName
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    

    open var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: kMainScreenWidth, height: kMainSCreenHeight - 64), style: UITableView.Style.plain)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: thirdCellId)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView.rowHeight = CGFloat(cellHeight)
        
        self.view.addSubview(self.tableView)
        
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
