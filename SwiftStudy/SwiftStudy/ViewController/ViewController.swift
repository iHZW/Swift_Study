//
//  ViewController.swift
//  Swift_Study
//
//  Created by 韩志伟 on 2020/4/8.
//  Copyright © 2020 韩志伟. All rights reserved.
//

import UIKit
import Alamofire
import ESPullToRefresh
import Toast_Swift

private let kMyCollectionViewCellKey = "kMyCollectionViewCellKey"
private let kRequestUrl = "https://m.stock.pingan.com/news/api/v2/news/channel/list?channelEnName=secchat,recommend&ps=20&cltplt=iph&cltver=7.3.0.0"

class ViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var dataArray : [HomeCellItem] = []
    
    //网格视图
    var mainCollectionView : UICollectionView!
    var request_nt: String = ""
    var headerAnimator: (ESRefreshProtocol & ESRefreshAnimatorProtocol)!
    var footAnimator: (ESRefreshProtocol & ESRefreshAnimatorProtocol)!
    var sortArr:Array<Any> = [1,2,3,6,4,7,3,8,9]

    var refreshAnimatorType: ESRefreshAnimatorType? {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        refreshAnimatorType = .day

        self.createUI()
        self.createNavgationUI()
        self.testRequest()

    }
    
    func createNavgationUI() {
        let rightBtn = WFCreateButton(target: self, rect: CGRect.init(x: 0, y: 0, width: 80, height: 40), title: "", titleColor: .red, selector: #selector(requestNext), event: .touchUpInside)
        rightBtn.setImage(UIImage.init(named: "loading_refresh"), for: .normal)
        rightBtn.contentHorizontalAlignment = .right
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        //下边设置是无效的,直接设置navigationItem即可
//        self.navigationController?.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.rightBarButtonItem = rightItem

        
        let leftBtn =  WFCreateButton(target: self, rect: CGRect.init(x: 0, y: 0, width: 80, height: 40), title: "", titleColor: .blue, selector: #selector(refreshHome), event: .touchUpInside)
        leftBtn.setImage(UIImage.init(named: "left_drawer_open"), for: .normal)
        leftBtn.contentHorizontalAlignment = .left
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func mySortRunc(array:inout Array<Any>, sortClosure:(Int, Int, Array<Any>) -> Bool) -> Array<Any> {
        WFLog("------\(array)000000000")
        for x in 0..<array.count - 1 {
            var flag = true
            for y in 0..<(array.count - x - 1) {
                if sortClosure(y, y + 1, array) {
                    array.swapAt(y, y + 1)
                    flag = false
                }
            }
            if flag {
                break
            }
        }
        return array
    }
    
    func sortNewFunc(array:Array<Any>) -> Array<Any> {
        var list = array
        // 循环次数
        var count = 1
        
        /*
         普通方案
         */
//        for i in 0..<list.count-1 {
//            count = i
//            for j in 0..<list.count - 1 - i {
//                //交换
//                if (list[j] as! Int ) > (list[j+1] as! Int) {
//                    list.swapAt(j, j+1)
//                }
//            }
//        }
        
        /*
         改进方法
         */
//        for i in 0..<list.count-1 {
//            var flag = true
//            count = i
//            for j in 0..<list.count - 1 - i {
//                if (list[j] as! Int ) > (list[j+1] as! Int) {
//                    list.swapAt(j, j+1)
//                    flag = false
//                }
//            }
//            if flag {
//                break
//            }
//        }
        
        /*
         优化
         */
        var swap = 0
        var k = list.count - 1
        for i in 0..<list.count {
            // 默认交换索引为0, 防止数组完全有序时,让然继续多次循环
            var flag = true
            count = i
            for j in 0..<k {
                if (list[j] as! Int ) < (list[j+1] as! Int) {
                    list.swapAt(j, j+1)
                    flag = false
                    swap = j
                }
            }
            k = swap
            if flag {
                break
            }
        }

        print("循环次数为:\(count) \narray:\(list)")
        return list
    }
    
    //抽屉
    @objc func refreshHome() {
        var array:Array<Any> = [1,2,3,6,4,7,3,8,9]
//        let array_new = sortNewFunc(array: array)
        
        let tempArr = mySortRunc(array: &array, sortClosure: {(x:Int, y:Int, arr:Array<Any>) ->Bool in
            let value1 = arr[x] as! Int
            let value2 = arr[y] as! Int
            return value1 < value2
        })
        
        sortArr = sortNewFunc(array: sortArr)
        WFLog("\(sortArr)")
        
        self.view.makeToast("-09-09-00--09-0", position: .center)
        
        return
        
//        self.testRequest()
        let ctrl = ResearchViewController.init()
        self.navigationController?.pushViewController(ctrl, animated: true)
                
        let age = 1
        assert(age >= 0, "A person's age cannot be less than zero")
        
        //空合运算符
        /** 使用前提,使用对象必须是可选类型 */
        let defaultString = "defaultName"
        var userName : String?
        userName = "Han Zhiwei"
        let resultName = userName ?? defaultString
        WFLog("resultName = \(resultName)")
        
        let name = ["0", "1", "2", "3", "4"]
        
        for index in 0..<name.count {
            WFLog("index = \(index)")
        }
        
        for _ in name[2...] {
            
        }
        
        for _ in name[...3] {
            
        }
        
        for _ in name[..<3] {
            
        }
        
        let linesWithIndentation = """
            This line doesn't begin whith whitespace.
            This line begins with four spaces.
            This line doesn't begin whit whitespace.
            """
        WFLog("linesWithIndentation = \(linesWithIndentation)")
        
        var word = "cafe"
        word += "\u{301}"
        WFLog("the number of characters in \(word) is \(word.count)")
        
        for index in word.indices {
//            print("\(word[index])", terminator: "/")
            print("\(word[index])", terminator: "+")
        }
        
        var gameStatus = true
        var gameCount = 0
        gameLoop: while gameStatus {
            gameCount += 1;
            if gameCount == 20 {
                gameStatus = false
                break gameLoop
            }
        }
//        let tempArray = ["0", "2"]
        var nameDic = ["one": "hzw"]
        if nameDic["one"] == "hzw" {
            nameDic = ["one":""]
            greet(person: nameDic)
        }
        
        if #available(iOS 10.0, macOS 10.12, *) {
            /** 在iOS 上使用iOS10.0及以上版本 的API  在mac上使用 macOS10.12的API */
        }else{
            /** 使用之前版本的API */
        }
        
        
        
    }
    
    
    func greet(person: [String: String]) {
        guard let name =  person["one"] else {
            return
        }
        print("\(name)")
    }
    
    //加载下一页数据
    @objc func requestNext(sender: UIButton) {
//        self.request_nt = ""
//        self.testRequest()
        //开启动画
        self.startAnimation(sender: sender)
        //下拉刷新
        self.mainCollectionView.es.startPullToRefresh()
    }
    
    func startAnimation(sender: UIButton) {
        // 创建动画
        let animation = CABasicAnimation()
        // 设置动画的keyPath
        animation.keyPath = "transform.rotation"
        //目标值
        animation.toValue = Double.pi * 2
        //动画时长
        animation.duration = 1
        
        animation.isRemovedOnCompletion = false
        animation.fillMode = .backwards
        //添加动画到layer层
        sender.imageView?.layer.add(animation, forKey: nil)
    }
    

    func createUI() {

        let collectionLayout = UICollectionViewFlowLayout.init()
        collectionLayout.itemSize = CGSize.init(width: kMainScreenWidth/2 - kContentSideHorizSpace, height: 200)
        //设置cell上下之间的最小间距(纵向滚动,横向相反)
        collectionLayout.minimumLineSpacing = 10
        //设置cell左右之间的间距(纵向滚动,横向相反)
        collectionLayout.minimumInteritemSpacing = 5
        //设置滚动方向
        collectionLayout.scrollDirection = .vertical
        //设置整个collectionView的边界约束
        collectionLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)

//        var header: ESRefreshProtocol & ESRefreshAnimatorProtocol
//        var footer: ESRefreshProtocol & ESRefreshAnimatorProtocol
//        //美团的样式
//        header = MTRefreshHeaderAnimator.init(frame: CGRect.zero)
//        footer = MTRefreshFooterAnimator.init(frame: CGRect.zero)
//
        self.mainCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: kSafeAreaTopStatusNavBarHeight, width: kMainScreenWidth, height: kMainSCreenHeight - kSafeAreaTopStatusNavBarHeight - kMainTabBarHeight - kPORTRAIT_SAFE_AREA_BOTTOM_SPACE), collectionViewLayout: collectionLayout)
        self.mainCollectionView.backgroundColor = UIColor.white
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: kMyCollectionViewCellKey)
        self.view.addSubview(self.mainCollectionView)
        
//        self.mainCollectionView?.es.addPullToRefresh {
//            self.request_nt = ""
//            self.testRequest()
//        }
//
//
//        self.mainCollectionView?.es.addInfiniteScrolling {
//            self.testRequest()
//        }

        
        self.mainCollectionView.es.addPullToRefresh(animator: self.headerAnimator, handler: {
            [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self?.request_nt = ""
                self?.testRequest()
            }
        })
        
//        self.mainCollectionView.es.
        
        self.mainCollectionView.es.addInfiniteScrolling(animator: self.footAnimator, handler: {
            [weak self] in
            self?.testRequest()
        })

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //自动请求
            self.mainCollectionView.es.autoPullToRefresh()
        }
        
    }
    
    
    @objc func nextActon (index: NSInteger, name: String) {
        let viewCtrl = ViewDetailPage.init()
        viewCtrl.transName = name
        self.navigationController?.pushViewController(viewCtrl, animated: true)
    }
    
    
    //collection dataSource/delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMyCollectionViewCellKey, for: indexPath) as! HomeCollectionViewCell
        cell.currentIndex = indexPath.row
//        if indexPath.row%3 == 0 {
//            cell.imageName = "default_image"
//        }else if indexPath.row%3 == 1 {
//            cell.imageName = "default_image_one"
//        }else{
//            cell.imageName = "default_image_two"
//        }
//        cell.titleName = "我是老\(indexPath.row)"
//        cell.infoModel = self.dataArray[indexPath.row]
        let infoModel: HomeCellItem = self.dataArray[indexPath.row]
        cell.configModel(infoModel: infoModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.testRequest()
//        self.testRequestTwo()
//        self.testRequestThree()
        
//        let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
//        let name = cell.titleName ?? "没有传参"
//        self.nextActon(index: indexPath.row, name: name)
        let infoModel: HomeCellItem = self.dataArray[indexPath.row]
        self.selectItemActoin(link: infoModel.detailLink!)
    }
    
    func selectItemActoin(link: String) {
        let webViewCtrl = BaseWebViewController()
        webViewCtrl.requestUrl = link
        webViewCtrl.titleName = "资讯"
        self.navigationController?.pushViewController(webViewCtrl, animated: true)
    }
        
    
    func testRequest() {
        var url = kRequestUrl
        if self.request_nt.validString() == false {
            url.append("&nt="+self.request_nt)
        }
        WFRequestDataLoader.request(method: .get, url: url) { (result) in
            if result.code == .success {
                //从数组反序列化模型数组
//                let datas = Array<HomeCellItem>.deserialize(from: result.newsList as? NSArray) ?? []
                //可以直接写明数组中的元素类型
                let datas = result.newsList!
                
                if self.request_nt.validString() == true {
                    self.dataArray = datas
                    self.mainCollectionView.es.stopPullToRefresh()
                }else{
                    self.dataArray += datas
                    self.mainCollectionView.es.stopLoadingMore()
                }
                
                if result.nt!.validString() == false {
                    self.request_nt = result.nt!
                }else{
                }
//                WFLog("\(datas)\n\(self.request_nt)")
                //更新UI
                self.mainCollectionView.reloadData()
            }else{
                self.mainCollectionView.es.stopPullToRefresh()
                self.mainCollectionView.es.stopLoadingMore()
            }
        }
    }
    
    func testRequestTwo() {
        let urlString = "https://wanandroid.com/article/listproject/0/json"
        let url = URL.init(string: urlString)
        WFRequestDataLoader.request(method: .get, url: url!) { (result) in
            
            
        }
    }
    
    func testRequestThree() {
        let urlString = "https://httpbin.org/post"
        let url = URL.init(string: urlString)
        let parameters: [String : Any] = ["foo": [1,2,3], "bar": ["baz": "qux"]]
        WFRequestDataLoader.request(method: .post, url: url!, parameters: parameters) { (result) in
            if result.code == .success {
                let datas = Array<HomeListModel>.deserialize(from: result.newsList as NSArray?) ?? []
                WFLog("datas = \(datas)")
            }
        }
    }

}

