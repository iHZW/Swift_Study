//
//  SecondViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

let cellId = "SecondCellId"

import UIKit

class SecondViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    open var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: (kMainScreenWidth), height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight), style: UITableView.Style.plain)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 60
//        self.tableView.register(UITableViewCell.class(), forCellReuseIdentifier: cellId)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "我是第:\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        WFLog("点击了第\(indexPath.row)")
        self.navigationController?.pushViewController(ViewDetailPage(), animated: true)
        let tempCtrl = UIViewController.current()
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


