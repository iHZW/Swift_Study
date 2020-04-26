//
//  CenterSegmentView.swift
//  PersonalCenter
//
//  Created by mqt on 2018/5/12.
//  Copyright © 2018年 mqt. All rights reserved.
//

import UIKit

class CenterSegmentView: UIView{
    
    /// 分页标题数组
    var nameArray:[String] = []
    
    /// 标题按钮高度
    var segmentScrollVHeight:CGFloat = 41
    
    /// 标题正常颜色
    var titleNormalColor:UIColor = UIColor.gray
    
    /// 标题选中颜色
    var titleSelectColor:UIColor = UIColor.orange
    
    /// 选中字体大小
    var selectFont = UIFont.systemFont(ofSize: 19)
    
    /// 未选中字体大小
    var normalFont = UIFont.systemFont(ofSize: 17)
    
    /// 选中线背景颜色
    var lineSelectedColor = UIColor.orange
    
    /// 分割线颜色
    var downColor = HexColor(hex: 0xEDEDED)
    
    /// 选中的index
    var selectedIndex:Int = 0
    
    /// 底部滑块高度
    var lineHeight:CGFloat = 1
    
    /// 底部滑块宽度
    var lineWidth: CGFloat = 25
    
    /// 占比
    private var offsetX = 0

    /// 显示item的宽度
    var itemWidth: CGFloat!
    
    /// huidiao
    typealias PageBlock = (_ selectIndex:Int)->Void
    var pageBlock:PageBlock? = {
        (selectIndex: Int) in
        WFLog("selectIndex = \(selectIndex)")
    }
    
    /// 包含分页标题view
    lazy var segmentView:UIScrollView = {
       let view = UIScrollView(frame: CGRect.zero)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    ///
    lazy var segmentScrollV:UIScrollView = {
       let view = UIScrollView()
        return view
    }()
    
    /// 选中下划线
    lazy var line:UILabel = {
       let label = UILabel(frame: CGRect.zero)
       
        return label
    }()
    
    /// 选中的按钮
    lazy var seleBtn:UIButton = {
       let btn = UIButton(frame: CGRect.zero)
        return btn
    }()
    
    /// 分割线
    lazy var down:UILabel = {
       let label = UILabel(frame: CGRect.zero)
         label.backgroundColor = UIColor.gray
        return label
    }()
    
    /// 子控件数组
    var controllers:[UIViewController] = []
    
    
    convenience init(frame: CGRect,controllers:[UIViewController],titleArray:[String],selectIndex:Int,lineHeight:CGFloat) {
        self.init(frame: frame)
        self.controllers = controllers
        self.nameArray = titleArray
        self.lineHeight = lineHeight
        self.selectedIndex = selectIndex
        self.initData()
    }
    
    convenience init(frame: CGRect, normalFont: UIFont, selectFont:UIFont, normalColor: UIColor, selectColor: UIColor, controllers: [UIViewController], titleArray: [String], selectIndex: Int) {
        self.init(frame: frame)
        self.selectFont = selectFont
        self.normalFont = normalFont
        self.titleNormalColor = normalColor
        self.titleSelectColor = selectColor
        self.lineSelectedColor = selectColor
        self.controllers = controllers
        self.nameArray = titleArray
        self.selectedIndex = selectIndex
        self.initData()
    }
    
    func initData(){
        if self.nameArray.count == 0 && self.controllers.count == 0{
            return
        }
        //宽度
        self.itemWidth = frame.size.width / CGFloat(controllers.count)
        if controllers.count > 5 {
            self.itemWidth = (frame.size.width - 30) / 5
        }
        
        self.segmentView.frame = CGRect(x: 0, y: 0, width:frame.size.width, height: segmentScrollVHeight)
        self.segmentView.tag = 50
        self.addSubview(self.segmentView)
        
        self.segmentScrollV.frame = CGRect(x: 0, y: self.segmentScrollVHeight, width: frame.size.width, height: frame.size.height - self.segmentScrollVHeight)
        self.segmentScrollV.contentSize = CGSize(width: frame.size.width * CGFloat(controllers.count), height: 0)
        self.segmentScrollV.delegate = self
        self.segmentScrollV.showsHorizontalScrollIndicator = false
        //是否开启平移，每次平移就是scrollView的宽度
        self.segmentScrollV.isPagingEnabled = true
        self.segmentScrollV.bounces = false
        
        self.addSubview(self.segmentScrollV)
        
        for (index,controller) in controllers.enumerated(){
            self.segmentScrollV.addSubview(controller.view)
            controller.view.frame = CGRect(x: CGFloat(index) * frame.size.width, y: 0, width: frame.size.width, height: frame.size.height - self.segmentScrollVHeight)
//            parentController.addChildViewController(controller)
//            controller.didMove(toParentViewController: parentController)
        }
        
        for (index,_)in controllers.enumerated(){
            let btn = UIButton(type: UIButton.ButtonType.custom)
            btn.frame = CGRect(x: CGFloat(index) * self.itemWidth, y: 0, width: self.itemWidth, height: self.segmentScrollVHeight)
            btn.backgroundColor = UIColor.white
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
            btn.tag = index
            btn.setTitle(self.nameArray[index], for: .normal)
            btn.setTitleColor(self.titleNormalColor, for: .normal)
            btn.setTitleColor(self.titleSelectColor, for: .selected)
            btn.addTarget(self, action: #selector(self.Click(sender:)), for: .touchUpInside)
            
            if self.selectedIndex == index{
                btn.isSelected = true
                self.seleBtn = btn
                btn.titleLabel?.font = self.selectFont
                //初始化选中的控制器CGPoint(,0)
                self.segmentScrollV.setContentOffset(CGPoint(x: CGFloat(btn.tag) * self.frame.size.width, y: 0), animated: true)
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SelectVC"), object: btn, userInfo: nil)
            }else{
                btn.isSelected = false
                btn.titleLabel?.font = self.normalFont
            }
            self.segmentView.addSubview(btn)
            self.segmentView.contentSize = CGSize(width: self.itemWidth * CGFloat(controllers.count), height: 0)
        }
        
        //分割线
        let downFrame = CGRect(x: 0, y: 40, width: self.itemWidth * CGFloat(controllers.count), height: 0.5)
        self.down = UILabel(frame: downFrame)
        self.down.backgroundColor = self.downColor
        self.segmentView.addSubview(self.down)
        
        
        let lineFrame = CGRect(x: self.itemWidth * CGFloat(selectedIndex), y: self.segmentScrollVHeight - self.lineHeight - 2, width: self.lineWidth, height: self.lineHeight)
        self.line = UILabel(frame: lineFrame)
        self.line.backgroundColor = self.lineSelectedColor
        self.line.tag = 100
        //初始化位置
        var lineCeter = self.line.center
//        lineCeter.x = frame.size.width / CGFloat(controllers.count * 2) + frame.size.width / CGFloat(controllers.count) * CGFloat(self.seleBtn.tag)
        lineCeter.x = (self.itemWidth * CGFloat(selectedIndex) + self.itemWidth/2)

        self.line.center = lineCeter
        self.segmentView.addSubview(self.line)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func Click(sender:UIButton){
        self.seleBtn.titleLabel?.font = self.normalFont
        self.seleBtn.isSelected = false
        self.seleBtn = sender
        self.pageBlock?(sender.tag)
        self.selectedIndex = sender.tag
        self.seleBtn.titleLabel?.font = self.selectFont
        self.seleBtn.isSelected = true
        
        self.segmentScrollV.setContentOffset(CGPoint(x: CGFloat(sender.tag) * self.frame.size.width, y: 0), animated: true)
            
        // MARK: -- 计算顶部滚动视图偏移量
        var point_x = CGFloat(sender.tag) * self.itemWidth
        //最大移动距离
        let max_X = self.itemWidth * CGFloat(controllers.count) - CGFloat(self.frame.size.width)
        if (point_x > CGFloat(self.frame.size.width) / 2){
            if CGFloat(point_x - CGFloat(self.frame.size.width) / 2) < max_X{
                point_x = point_x - CGFloat(self.frame.size.width) / 2
            }else{
                point_x = max_X
            }
        }else{
            point_x = 0
        }
        self.segmentView.setContentOffset(CGPoint(x: point_x, y: 0), animated: true)
        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SelectVC"), object: sender, userInfo: nil)
    }
    
}

extension CenterSegmentView:UIGestureRecognizerDelegate{
    //处理左滑右滑，解决系统右划手势与ScrollView右划手势冲突
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // 首先判断otherGestureRecognizer是不是系统pop手势
        if (otherGestureRecognizer.view?.isKind(of: NSClassFromString("UILayoutContainerView")!))!{
            // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
            if otherGestureRecognizer.state == UIGestureRecognizer.State.began && self.segmentScrollV.contentOffset.x == 0{
                return true
            }
        }
        return false
    }
}

extension CenterSegmentView: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let btn = self.segmentView.viewWithTag(Int(self.segmentScrollV.contentOffset.x / self.frame.size.width))
        self.seleBtn.isSelected = false
        self.seleBtn.titleLabel?.font = self.normalFont
        if let button = btn {
            self.seleBtn = button as! UIButton
            self.seleBtn.isSelected = true
            self.selectedIndex = self.seleBtn.tag
            self.seleBtn.titleLabel?.font = self.selectFont
            self.pageBlock?(button.tag)
        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = (self.itemWidth / scrollView.bounds.width) * scrollView.contentOffset.x
        let xoffset = offsetX
        self.line.transform = CGAffineTransform(translationX: xoffset, y: 0)
        
        
        // MARK: -- 同步顶部滚动视图偏移量
        var point_x = CGFloat(scrollView.contentOffset.x/scrollView.bounds.width) * self.itemWidth
        //最大移动距离
        let max_X = self.itemWidth * CGFloat(controllers.count) - CGFloat(self.frame.size.width)
        if (point_x > CGFloat(self.frame.size.width) / 2){
            if CGFloat(point_x - CGFloat(self.frame.size.width) / 2) < max_X{
                point_x = point_x - CGFloat(self.frame.size.width) / 2
            }else{
                point_x = max_X
            }
        }else{
            point_x = 0
        }
        self.segmentView.setContentOffset(CGPoint(x: point_x, y: 0), animated: true)
        
    }
}
