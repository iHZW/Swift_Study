//
//  WFCommonCell.swift
//  SwiftStudy
//
//  Created by 韩志伟 on 2020/4/9.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
//首先导入框架
import SnapKit

private let kWFLeftSpace = 15


class WFCommonCell: UITableViewCell {
    
    private var leftImageView : UIImageView?
    private var titleLabel : UILabel?
    private var subTitleLabel : UILabel?
    private var rightButton : UIButton?
    private var cellInfoModel : WFListInfoModel?

    open func leftImageName (imageName: String) {
        self.leftImageView?.image = UIImage.init(named: imageName)
    }
    
    open func cellInfoModel(infoModel: WFListInfoModel) {
        self.cellInfoModel = infoModel
        self.leftImageView?.image = UIImage.init(named: infoModel.leftImageName)
        self.titleLabel?.text = infoModel.titleName
        self.subTitleLabel?.text = infoModel.subTitleName
        self.rightButton?.setTitle(infoModel.rightBtnName, for: UIControl.State.normal)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        //创建UI  使用计算rect的方式布局
//        self.createUIOne()
        //创建UI  使用SnapKit框架实现约束布局
        self.createUITwo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建UI  使用计算rect的方式布局
    func createUIOne (){
        var origin_X = 15 as Int
        self.leftImageView = WFCreateImageView(rect: CGRect.init(x: origin_X, y: 0, width: cellHeight - 10*2, height: cellHeight - 10*2), imageName: "TabMenu_Mine_Highlight")
        self.leftImageView?.layer.masksToBounds = true
        self.leftImageView?.layer.cornerRadius = CGFloat((cellHeight-10*2)/2);
        origin_X += cellHeight
        
        self.titleLabel = WFCreateLabel(rect: CGRect.init(x: origin_X, y: 0, width: 100, height: cellHeight/2), title: "名称", titleColor: UIColor.black, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 25))
        self.subTitleLabel = WFCreateLabel(rect: CGRect.init(x: origin_X, y: cellHeight/2, width: 100, height: cellHeight/2), title: "详情", titleColor: UIColor.lightGray, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 15))
        origin_X += 100

        self.rightButton = WFCreateButton(target: self, rect: CGRect.init(x: Int(kMainScreenWidth - 15 - 80), y: 0, width: 80, height: cellHeight), title: "试试看", titleColor: UIColor.blue, selector: #selector(rightBtnAction), event: UIControl.Event.touchUpInside)
        
        self.contentView.addSubview(self.leftImageView!)
        self.contentView.addSubview(self.titleLabel!)
        self.contentView.addSubview(self.subTitleLabel!)
        self.contentView.addSubview(self.rightButton!)
    }
    
    //创建UI  使用SnapKit框架实现约束布局
    func createUITwo() {
        self.leftImageView = WFCreateImageView(rect: CGRect.zero, imageName: "TabMenu_Mine_Highlight")
        self.leftImageView?.layer.masksToBounds = true
        self.leftImageView?.layer.cornerRadius = CGFloat((cellHeight-10*2)/2);
        self.titleLabel = WFCreateLabel(rect: CGRect.zero, title: "名称", titleColor: UIColor.black, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 25))
        self.subTitleLabel = WFCreateLabel(rect: CGRect.zero, title: "详情", titleColor: UIColor.lightGray, alignment: NSTextAlignment.left, font: UIFont.systemFont(ofSize: 15))
        self.rightButton = WFCreateButton(target: self, rect: CGRect.zero, title: "试试看", titleColor: UIColor.blue, selector: #selector(rightBtnAction), event: UIControl.Event.touchUpInside)
        //和OC 一样使用布局之前, 一定要将布局空间添加到父视图上, 不然直接crash
        self.contentView.addSubview(self.leftImageView!)
        self.contentView.addSubview(self.titleLabel!)
        self.contentView.addSubview(self.subTitleLabel!)
        self.contentView.addSubview(self.rightButton!)
        
        self.leftImageView?.snp_makeConstraints({ (make) in
            make.leading.equalToSuperview().offset(kWFLeftSpace)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(cellHeight-10*2)
        })
        
        self.titleLabel?.snp_makeConstraints({ (make) in
            if #available(iOS 11.0, *) {
                make.left.equalTo(self.leftImageView?.safeAreaLayoutGuide.snp.right as! ConstraintRelatableTarget).offset(10)
            } else {
                make.left.equalTo(self.leftImageView?.readableContentGuide.snp.right as! ConstraintRelatableTarget).offset(10)
                // Fallback on earlier versions
            }

            if #available(iOS 11.0, *) {
                make.bottom.equalTo(self.contentView.safeAreaLayoutGuide.snp.centerY as ConstraintRelatableTarget)
            } else {
                make.bottom.equalTo(self.contentView.readableContentGuide.snp.centerY as ConstraintRelatableTarget)
            }
            
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(100)
        })
        
        self.subTitleLabel?.snp_makeConstraints({ (make) in
            if #available(iOS 11.0, *) {
                make.left.equalTo(self.leftImageView?.safeAreaLayoutGuide.snp.right as! ConstraintRelatableTarget).offset(10)
            } else {
                make.left.equalTo(self.leftImageView?.readableContentGuide.snp.right as! ConstraintRelatableTarget).offset(10)
            }
            
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.titleLabel?.safeAreaLayoutGuide.snp.bottom as! ConstraintRelatableTarget)
            } else {
                make.top.equalTo(self.titleLabel?.readableContentGuide.snp.bottom as! ConstraintRelatableTarget)
            }
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-5)
        })
        
        self.rightButton?.snp_makeConstraints({ (make) in
            make.right.equalToSuperview().offset(-kWFLeftSpace)
            make.width.equalTo(80)
            make.top.bottom.equalToSuperview()
        })

    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //不带返回值的闭包
    private let studname = {(title: String) -> () in
        print("title = \(title)")
    }
    
    //返回string类型的闭包
    private let appendName = {(name: String) -> (String) in
        return "\(name)_0"
    }

    
    @objc func rightBtnAction(rightBtn: UIButton) {
    
        let name = rightBtn.titleLabel?.text
        self.studname(name!)
        
        let clickResultName = self.appendName(name!)
        print("result = \(clickResultName)")
        
        //更改数据源
          let titleName = self.cellInfoModel?.titleName
        //判断现有数据是否包含拼接的字符串
        if titleName?.contanins(find: name!) == false {
            self.cellInfoModel?.titleName = "\(titleName!)_\(name!)"
            let resultName = self.cellInfoModel?.titleName
            self.titleLabel?.text = resultName!
        }
    }

}
