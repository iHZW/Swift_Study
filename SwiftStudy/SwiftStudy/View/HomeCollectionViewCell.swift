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
    private var commentLabel: UILabel?
    private var timeLabel: UILabel?
    
    public var titleName : String?{
        didSet{
            self.contentLabel?.text = self.titleName
        }
    }
    
    public var imageName: String? {
        didSet{
            let imageUrl: String = "http://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p53688.jpg"
            self.imageView?.sd_setImage(with: URL.init(string: imageUrl), placeholderImage: UIImage.init(named: self.imageName!), options: SDWebImageOptions.continueInBackground, completed: nil)
        }
    }
    
    public var subTitle: String? {
        didSet{
            self.subLabel?.text = self.subTitle
        }
    }
    public var commentString: String? {
        didSet{
            let comment: String = self.commentString! + "人阅读"
            self.commentLabel?.text = comment
        }
    }
    
    public var timeString: String? {
        didSet{
            self.timeLabel?.text = getDateSringWithDateFoematter(dateFormat: "MM-dd HH:mm", dateString: self.timeString!)
        }
    }
    
    
    public var currentIndex: NSInteger?
    public var infoModel: HomeCellItem?
//    {
//        willSet{
//            self.titleName = infoModel?.title
//            self.subTitle = infoModel?.label
//            let imageUrl: String = infoModel?.imgUrl! ?? ""
//            self.imageView?.sd_setImage(with: URL.init(string: imageUrl), placeholderImage: UIImage.init(named: "default_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
//        }
//    }
    
    func configModel(infoModel: HomeCellItem)  {
        self.infoModel = infoModel
        self.titleName = infoModel.title
        self.subTitle = infoModel.label
        self.commentString = infoModel.hotIndex
        self.timeString = infoModel.publishTime
        let imageUrl: String = infoModel.imgUrl!
        self.imageView?.sd_setImage(with: URL.init(string: imageUrl), placeholderImage: UIImage.init(named: "default_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
    }
  
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
        self.contentLabel?.numberOfLines = 0
        self.contentLabel?.backgroundColor = UIColor.white
        self.contentView.addSubview(self.contentLabel!)
        
        self.subLabel = WFCreateLabel(rect: CGRect.zero, title: "小标题", titleColor: UIColor.lightGray, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 13))
        self.contentView.addSubview(self.subLabel!)
        
        
        self.commentLabel = WFCreateLabel(rect: CGRect.zero, title: "", titleColor: UIColor.lightGray, alignment: .left, font: .systemFont(ofSize: 13))
        self.contentView.addSubview(self.commentLabel!)
        
        self.timeLabel = WFCreateLabel(rect: CGRect.zero, title: "", titleColor: .lightGray, alignment: .left, font: .systemFont(ofSize: 13))
        self.contentView.addSubview(self.timeLabel!)

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
            make.right.equalToSuperview()
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
        
        self.commentLabel?.snp.makeConstraints({ (make) in
            make.top.bottom.equalTo(self.subLabel!)
            
            if #available(iOS 11.0, *) {
                make.left.equalTo(self.subLabel?.safeAreaLayoutGuide.snp.right as! ConstraintRelatableTarget).offset(kAdjustSpace)
            } else {
                make.left.equalTo(self.subLabel?.readableContentGuide.snp.right as! ConstraintRelatableTarget).offset(kAdjustSpace)
            }
        })
        
        self.timeLabel?.snp.makeConstraints({ (make) in
            make.top.bottom.equalTo(self.subLabel!)
            if #available(iOS 11.0, *) {
                make.left.equalTo(self.commentLabel?.safeAreaLayoutGuide.snp.right as! ConstraintRelatableTarget).offset(kAdjustSpace)
            } else {
                make.left.equalTo(self.commentLabel?.readableContentGuide.snp.right as! ConstraintRelatableTarget).offset(kAdjustSpace)
            }
            make.right.equalToSuperview()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
