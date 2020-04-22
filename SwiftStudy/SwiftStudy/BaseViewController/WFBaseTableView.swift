//
//  WFBaseTableView.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/22.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import ESPullToRefresh

class WFBaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
       
        super.init(frame: frame, style: style)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addPullToRefresh(handler: @escaping ESRefreshHandler) -> ESRefreshHeaderView {
        self.es.addPullToRefresh(handler: handler)
    }
    
    func addPullToRefresh(animator: ESRefreshProtocol & ESRefreshAnimatorProtocol, handler: @escaping ESRefreshHandler) -> ESRefreshHeaderView {
        self.es.addPullToRefresh(animator: animator, handler: handler)
    }
    
    
    func addInfiniteScrolling(handler: @escaping ESRefreshHandler) -> ESRefreshFooterView{
        self.es.addInfiniteScrolling(handler: handler)
    }
    
    func addInfiniteScrolling(animator: ESRefreshProtocol & ESRefreshAnimatorProtocol, handler: @escaping ESRefreshHandler) -> ESRefreshFooterView {
        self.es.addInfiniteScrolling(animator: animator, handler: handler)
    }

}
