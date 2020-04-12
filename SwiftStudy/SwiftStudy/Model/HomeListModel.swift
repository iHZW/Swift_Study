//
//  HomeListModel.swift
//  SwiftStudy
//
//  Created by HZW on 2020/4/11.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import HandyJSON


class HomeListModel: HandyJSON {
    var args: Any?
    var headers: Any?
    var wf_json: Any?
    var origin: String?
    var wf_url: String?
    
    var msg: String?
    var status: String?
    var errmsg: String?
    var err: String?
    
    var errorCode: String?
    var wf_data: Any?
    
    var lon: String?
    var level: String?
    var alevel: String?
    var lat: String?
    
    var code : WFResultState = .success
    var message : String?
    
    var total: String?
    var newsList : [HomeCellItem]?
    var userId : String?
    var nt: String?
    var pt: String?
    var ps: String?
//    @objc var my_date : Int = 0{
//        willSet {
//            print("newValue: ", newValue)
//        }
//        didSet {
//            print("oldValue: ", oldValue)
//        }
//    }
    //重写set方法
    @objc var handleTime : Int = 0{
        willSet {
            print("newValue: ", newValue)
        }
    }
    
    //资讯总数据源
//    var nodeList: [HomeSectionModel]?

    //转换数据完成
    func didFinishMapping() {
        self.userId = "234324324"
    }
    func mapping(mapper: HelpingMapper) {
        //字段替换
//        mapper.specify(property: &wf_json, name: "json")
//        mapper.specify(property: &wf_data, name: "data")
//        mapper.specify(property: &wf_url, name: "url")
    }

    required init() {
        
    }
}

//分组数据
class HomeSectionModel: HandyJSON {
    required init() {
        
    }
    
    var date: String?
    var week: String?
    var dateStr: String?
    var results: [HomeInfoModel]?
}

//cell 数据
class HomeInfoModel: HandyJSON {
    required init() {
        
    }
    
    var id: String?
    var wsid: String?
    var title: String?
    var type: String?
    var importance: String?
    var createdAt: String?
    var updatedAt: String?
    var contentHtml: String?
    var channelSet: String?
    var isSelf: Bool!
    var isShare: Bool?
    var isPurchase: Bool?
    var imageUrls: NSArray?
    var stocks: NSArray?
    var relStocks: NSArray?

}


//cellItem
class HomeCellItem: HandyJSON {
    required init() {}
    
    var newsId: String?
    var channelId: String?
    var type: String?
    var title: String?
    var digest: String?
    var simTitle: String?
    var simDigest: String?
    var imgUrl: String?
    var publishTime: String?
    var publishTimeDt: String?
    var isSubject: String?
    var extLink: String?
    var commentEnabled: String?
    var commentCount: String?
    var hotIndex: String?
    var dataVersion: String?
    var label: String?
    var relStocks: NSArray?
    var pos: String?
    var docreader: String?
    var Title: String?
    var traceId: String?
    var isAdsense: String?
    var detailLink: String?
    var probation: String?
    var judgeStock: String?
    var relListStocks: NSArray?
    var relatedBlocks: NSArray?
    var isRead: Bool?

    
}
