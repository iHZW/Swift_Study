//
//  ResearchViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2021/5/18.
//  Copyright © 2021 HZW. All rights reserved.
//

import UIKit

let kResearchCellId  = "kResearchCellId"

struct PersonCard {
    /** 肤色 */
    enum skin: Int {
        case yellow = 0, white = 1, black = 2
    }
    
    
}

class ResearchViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var dataArray = NSMutableArray.init(array: ["韩志伟" , "马婧", "马大帅" ,"马上到"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ResearchCtrl"
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight), style: UITableView.Style.plain)
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kResearchCellId)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        self.view.addSubview(self.tableView)
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kResearchCellId, for: indexPath)
        cell.textLabel?.text = self.dataArray.object(at: indexPath.row) as? String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
