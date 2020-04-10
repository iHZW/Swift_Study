//
//  ViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit

private let kMyCollectionViewCellKey = "kMyCollectionViewCellKey"

class ViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    open var dataArray : NSMutableArray?
    //网格视图
    var mainCollectionView : UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createUI()
    }
    
    func createUI() {

        let collectionLayout = UICollectionViewFlowLayout.init()
        collectionLayout.itemSize = CGSize.init(width: 100, height: 100)
        
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.minimumInteritemSpacing = 5
        collectionLayout.scrollDirection = .vertical
        collectionLayout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)

        self.mainCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 64, width: kMainScreenWidth, height: kMainSCreenHeight - 64), collectionViewLayout: collectionLayout)
        self.mainCollectionView?.backgroundColor = UIColor.gray
        self.mainCollectionView?.delegate = self
        self.mainCollectionView?.dataSource = self
        self.mainCollectionView?.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: kMyCollectionViewCellKey)
        
        self.view.addSubview(self.mainCollectionView!)
    }
    
    
    @objc func nextActon (index: NSInteger, name: String) {
        let viewCtrl = ViewDetailPage.init()
        viewCtrl.transName = name
        self.navigationController?.pushViewController(viewCtrl, animated: true)
    }
    
    
    //collection dataSource/delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMyCollectionViewCellKey, for: indexPath) as! HomeCollectionViewCell
        cell.currentIndex = indexPath.row
        cell.titleName = "我是老\(indexPath.row)"
        cell.setTitleName(name: "我是老\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
        let name = cell.titleName ?? "没有传参"
        self.nextActon(index: indexPath.row, name: name)
    }

}

