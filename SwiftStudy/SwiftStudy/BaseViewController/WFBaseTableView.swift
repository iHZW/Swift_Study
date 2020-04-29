//
//  WFBaseTableView.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/22.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import ESPullToRefresh

public enum ESRefreshAnimatorType: String {
    //默认类型
    case defaultTyoe = "DefaultType"
    //美团类型
    case meituan = "MeiTuanType"
    //微信类型
    case wechat = "WeChat"
    //其他类型
    case day = "Day"
}


class WFBaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
       
        super.init(frame: frame, style: style)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private var headerAnimator: (ESRefreshProtocol & ESRefreshAnimatorProtocol)!
    private var footAnimator: (ESRefreshProtocol & ESRefreshAnimatorProtocol)!
   
    private var refreshAnimatorType: ESRefreshAnimatorType? {
        didSet{
            switch refreshAnimatorType {
            case .meituan:
                headerAnimator = MTRefreshHeaderAnimator.init(frame: CGRect.zero)
                footAnimator = MTRefreshFooterAnimator.init(frame: CGRect.zero)
                break
            case .wechat:
                headerAnimator = WCRefreshHeaderAnimator.init(frame: CGRect.zero)
                footAnimator = ESRefreshFooterAnimator.init(frame: CGRect.zero)
            case .day:
                headerAnimator = ESRefreshDayHeaderAnimator.init(frame: CGRect.zero)
                footAnimator = ESRefreshFooterAnimator.init(frame: CGRect.zero)
            default:
                headerAnimator = ESRefreshHeaderAnimator.init(frame: CGRect.zero)
                footAnimator = ESRefreshFooterAnimator.init(frame: CGRect.zero)
            }
        }
    }
    
    @discardableResult
    func addPullToRefresh(handler: @escaping ESRefreshHandler) -> ESRefreshHeaderView {
        self.refreshAnimatorType = .defaultTyoe
        return self.es.addPullToRefresh(animator: self.headerAnimator, handler: handler)
    }
    
    @discardableResult
    func addPullToRefresh(animatorType: ESRefreshAnimatorType, handler: @escaping ESRefreshHandler) -> ESRefreshHeaderView {
        self.refreshAnimatorType = animatorType
        return self.es.addPullToRefresh(animator: self.headerAnimator, handler: handler)
    }
    
    @discardableResult
    func addInfiniteScrolling(handler: @escaping ESRefreshHandler) -> ESRefreshFooterView{
        self.refreshAnimatorType = .defaultTyoe
        return self.es.addInfiniteScrolling(animator: self.footAnimator, handler: handler)
    }
    
    @discardableResult
    func addInfiniteScrolling(animatorType: ESRefreshAnimatorType, handler: @escaping ESRefreshHandler) -> ESRefreshFooterView {
        self.refreshAnimatorType = animatorType
        return self.es.addInfiniteScrolling(animator: self.footAnimator, handler: handler)
    }
    
}
