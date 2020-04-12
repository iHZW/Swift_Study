//
//  HomeCollectionViewCell.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/10.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import SnapKit

private let kAdjustSpace = 5

class HomeCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView?
    private var contentLabel : UILabel?
    private var subLabel: UILabel?
    
    func configModel(model: HomeCellItem) {
        
    }
    
    public var titleName : String?{
        didSet{
            self.contentLabel?.text = self.titleName
        }
    }
    
    public var imageName: String? {
        didSet{
            self.imageView?.image = UIImage.init(named: self.imageName!)
        }
    }
    
    public var subTitle: String? {
        didSet{
            self.subLabel?.text = self.subTitle
        }
    }
    
    public var currentIndex: NSInteger?
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true
        
        self.createSubViews()
    }
    
    func createSubViews() {
        
        self.imageView = WFCreateImageView(rect: CGRect.zero, imageName: "default_image")
        self.contentView.addSubview(self.imageView!)
        
        self.contentLabel = WFCreateLabel(rect: CGRect.zero, title: "我是CollectionView", titleColor: HexColor(hex: 0xf82c88), alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 20))
        self.contentLabel?.backgroundColor = UIColor.white
        self.contentView.addSubview(self.contentLabel!)
        
        self.subLabel = WFCreateLabel(rect: CGRect.zero, title: "小标题", titleColor: UIColor.lightGray, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 13))
        self.contentView.addSubview(self.subLabel!)

        //布局
        self.imageView?.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
        })
        
        self.contentLabel?.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.imageView?.safeAreaLayoutGuide.snp.bottom as! ConstraintRelatableTarget).offset(kAdjustSpace)
            } else {
                make.top.equalTo(self.imageView?.readableContentGuide.snp.bottom as! ConstraintRelatableTarget).offset(kAdjustSpace)
            }
            make.left.equalToSuperview().offset(kAdjustSpace)
//            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.subLabel?.snp.makeConstraints({ (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.contentLabel?.safeAreaLayoutGuide.snp.bottom as! ConstraintRelatableTarget).offset(kAdjustSpace)
            } else {
                make.top.equalTo(self.contentLabel?.readableContentGuide.snp.bottom as! ConstraintRelatableTarget).offset(kAdjustSpace)
            }
            make.left.equalTo(self.contentLabel!)
            make.bottom.equalToSuperview().offset(-kAdjustSpace)
//            make.right.equalToSuperview()
        })
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
