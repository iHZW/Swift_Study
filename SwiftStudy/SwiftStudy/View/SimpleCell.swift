//
//  SimpleCell.swift
//  SwiftStudy
//
//  Created by hzw on 2022/9/29.
//  Copyright © 2022 HZW. All rights reserved.
//

import UIKit
import Toast_Swift
import SCLAlertView

class SimpleCell: UITableViewCell {

    private var titleLabel: UILabel = UILabel(frame: CGRect.zero)
    
    private var rightBtn: UIButton = UIButton(type: .custom)
    
    private var pageControl: UIPageControl = UIPageControl(frame: .zero)
    
    lazy var s_imageView: UIImageView! = {
        let image = UIImage(named: "point_map")
        let imageView = UIImageView(frame: .init(x: CGRectGetMaxX(self.titleLabel.frame) + 10, y: 0, width: 50, height: 80))
        imageView.contentMode = .center
        imageView.image = image
        return imageView
    }()
    
    lazy var wfPageControl: WEIPageControl = {
        $0.frame(CGRect(x: 0, y: 0, width: 80, height: 20))
        $0.numberOfPages = 4
        $0.currentPage = 1
        $0.localOtherColor = .cyan
        $0.localCurrentColor = .systemPink
        $0.currentWidthMultiple = 2.0
        $0.pointSize = CGSize.init(width: 9, height: 9)
        $0.clickPoint { [unowned self] (index) in
            print("点击了---\(String(describing: index))")
            self.changeAction(index: index ?? 0)
            self.wfPageControl.currentPage = index ?? 0
        }
        return $0
    }(WEIPageControl())
    
//    pageControl2.frame = CGRect.init(x: left, y: scrollView2.frame.maxY, width: width, height: 20)
//    pageControl2.localOtherColor = .blue
//    pageControl2.localCurrentColor = .systemPink
//    pageControl2.numberOfPages = pageCount//总页数
//    pageControl2.currentWidthMultiple = 4//当前点的宽度为其他点的4倍
//    pageControl2.pointSize = CGSize.init(width: 9, height: 9)//点的size
//    pageControl2.clickPoint { (index) in//圆点的点击事件
//        self.scrollView2.setContentOffset(CGPoint.init(x: width * CGFloat(index!), y: 0), animated: true)
//    }
    
    
//    lazy var s_pageControl = UIPageControl! = {
//        let tempPageControl = UIPageControl.init(frame: CGRect(x: CGRectGetMaxX(self.s_imageView.frame) + 10, y: 0, width: 100, height: 80))
//
//        return tempPageControl
//    }()
    
    open func setTitle(title: String) {
        self.titleLabel.text = title
    }
    
    open func setBtnName(name: String) {
        print("----\(name)--")
        self.rightBtn.setTitle(name, for: .normal)
    }
    
    open func setImageName(imageName:String) {
        print("--setImageName--\(imageName)--")
        self.s_imageView?.image = UIImage(named: imageName)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.loadSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadSubViews() {
        
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = UIColor.cyan
        self.titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel.frame = CGRect(x: 15, y: 0, width: 100, height: 80)
        self.contentView.addSubview(self.titleLabel)
        
        //划线
//        self.titleLabel.addBorderTop(borderWidth: 2, borderColor: .red)
        self.titleLabel.addBorderLeft(borderWidth: 2, borderColor: .red)
//        self.titleLabel.addBorderBottom(borderWidth: 2, borderColor: .red)
        self.titleLabel.addBorderRight(borderWidth: 2, borderColor: .red)
        
        
//        self.titleLabel.drawCircle(fillColor: .clear, strokeColor: .red, strokeWidth: 2.0)
        
        self.rightBtn.frame = CGRect(x: kMainScreenWidth - 100, y: 0, width: 50, height: 80)
        self.rightBtn.backgroundColor = UIColor.yellow
        self.rightBtn.setTitleColor(.blue, for: .normal)
        self.rightBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.contentView.addSubview(self.rightBtn)
        
        self.contentView.addSubview(self.s_imageView)
        
//        self.pageControl.frame = CGRect(x: CGRectGetMaxX(self.s_imageView.frame) + 10, y: 0, width: 50, height: 80)
//        pageControl.numberOfPages = 3
//        pageControl.backgroundColor = .systemPink
//        pageControl.currentPage = 1
//        pageControl.currentPageIndicatorTintColor = .cyan
//        pageControl.pageIndicatorTintColor = .white
//        // 添加交互事件
//        pageControl.addTarget(self, action: #selector(changeAction), for: .valueChanged)
//        self.contentView.addSubview(self.pageControl)
    
        
        self.wfPageControl.frame = CGRect(x: CGRectGetMaxX(self.s_imageView.frame) + 10, y: CGRectGetMidY(self.titleLabel.frame) - 10, width: 80, height: 20)
        self.contentView.addSubview(self.wfPageControl)
    }
    
    
    @objc func btnAction (param:UIButton) {
        let name = param.titleLabel?.text
        print("-点击了-\(param)--\(String(describing: name))-")
        
        let image = UIImage(named: "point_map")
        self.s_imageView?.image = image
                
//        self.makeToast("This is a piece of toast")

//        self.makeToast("Hello world!", point: CGPoint(x: 100, y: 100), title: "提示", image: nil) { didTap in
//            print("didRap: \(didTap)")
//        }
//        UIViewController.current().view.makeToast("This is a piece of toast")
        
//        SCLAlertView().showInfo("提示", subTitle: "100")
//        SCLAlertView().showWait("稍等", subTitle: "111")
//        SCLAlertView().showNotice("Notice", subTitle: "1111231\nasdfasdfasdf\nqweqwerqwer")
        let config = SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 2.0) {
            print("时间到")
        }
        SCLAlertView().showTitle("提示", subTitle: "确定吗?", timeout: config, completeText: "确定", style: .success)
    }
    
    @objc func changeAction(index:Int) {
        
        // Sheet
        let alertController = WFAlertController.alertSheet(title: "Sheet").add(title: "title1", style: .default) {index in
            // your code
        }.add(title: "title2", style: .destructive) {index in
            // your code
        }.add(title: "cancel", style: .cancel) {index in
           // your code
        }.finish()
        
        // Alert
        let alertController1 = WFAlertController.alertAlert(title: "title", message: "message", okTitle: "ok", cancelTitle: "cancel") {
            // your code
            print("---\($0)")
        }
        

        UIViewController.current().navigationController?.present(alertController, animated: true)
        
//        print("---currentPage\(parma.currentPage)--count\(parma.numberOfPages)")
    }
}
