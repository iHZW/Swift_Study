//
//  HomeCollectionViewCell.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/10.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit


class HomeCollectionViewCell: UICollectionViewCell {
    
    open var contentLabel : UILabel?
    open var titleName : String?
    public var currentIndex: NSInteger?
    
    func setTitleName(name: String) -> () {
        self.contentLabel?.text = name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white

        self.contentLabel = WFCreateLabel(rect: CGRect.zero, title: "我是CollectionView", titleColor: UIColor.green, alignment: NSTextAlignment.center, font: UIFont.systemFont(ofSize: 20))
        self.contentLabel?.backgroundColor = UIColor.white
        self.contentView.addSubview(self.contentLabel!)
        //布局
        self.contentLabel?.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
