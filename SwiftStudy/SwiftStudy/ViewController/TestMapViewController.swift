//
//  TestMapViewController.swift
//  SwiftStudy
//
//  Created by HZW on 2020/5/7.
//  Copyright © 2020 HZW. All rights reserved.
//

import UIKit
import MapKit

class TestMapViewController: BaseViewController  {

    private var mapView: MKMapView!
    
    private var locationBtn: UIButton!
    
    var locationManager: CLLocationManager = CLLocationManager()

//    (21.283921, -157.831661)
    var initialLocation = CLLocation.init(latitude: 31.147387, longitude: 121.493077)//设置一个初始位置
    /**
         当你试图告诉地图上显示的内容时，你不能仅仅给经纬度，这足以使地图居中，但是您需要指定要显示的矩形区域
      以获得正确的缩放级别。
      */

    let regionRadius:CLLocationDistance = 1000


//    private var userLocation: MKUserLocation!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapView = MKMapView.init(frame: .zero)
        //是否显示用户当前位置 ios8之后才有，默认为false
        self.mapView.showsUserLocation = true
        //地图是否可滚动，默认为true
        self.mapView.isScrollEnabled = true
         //地图是否可缩放，默认为true
        self.mapView.isZoomEnabled = true
        // 设置跟踪并在地图上显示用户的当前位置，地图会跟随用户的前进方向进行旋转
        self.mapView.userTrackingMode = .followWithHeading
        self.mapView.delegate = self
        
//        if #available(iOS 11.0, *) {
//            self.mapView.mapType = .mutedStandard
//        } else {
//            self.mapView.mapType = .hybrid
//        }
        self.mapView.mapType = .standard

        self.view.addSubview(self.mapView)

        
        self.mapView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalToSuperview().offset(kSafeAreaTopStatusNavBarHeight)
        }
        
        
        self.locationBtn = WFCreateButton(target: self, rect: .zero, title: "", titleColor: .black, selector: #selector(TestMapViewController.updateLocation), event: .touchUpInside)
        self.locationBtn.setImage(UIImage.init(named: "location"), for: UIControl.State.normal)
        self.view.addSubview(self.locationBtn)
        self.view.bringSubviewToFront(self.locationBtn)
        
        self.locationBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 80, height: 80))
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        
        
        /**
         这将调用帮助程序来放大initialLocation启动。
         构建和运行应用程序，现在应该放大到威基基的心脏：]
         */
//        centerMapOnLocation(location: initialLocation)
        let artWork = Artwork.init(title: "凌兆五村", locationName: "凌兆五村南区", discipline: "sculpture", coordinate: CLLocationCoordinate2DMake(31.149676, 121.508754))
        mapView.addAnnotation(artWork)
        
        //初始化一个位置
//        self.addAnnotaionToMapView(coorinate2D: CLLocationCoordinate2DMake(31.149676, 121.508754))
//        self.addAnnotaionToMapView(coorinate2D: self.locationManager.location?.coordinate ?? CLLocationCoordinate2DMake(31.149676, 121.508754))
        
        mapView.delegate = self
    }
    
    
    //定位到当前位置
    @objc func updateLocation() {
        
//        self.initialLocation.coordinate
        self.addAnnotaionToMapView(coorinate2D: self.initialLocation.coordinate)
    }
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.requestLocation()
    }
    
    func centerMapOnLocation(location:CLLocation) {
         let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius * 2.0,longitudinalMeters: regionRadius * 2.0 )
         mapView.setRegion(coordinateRegion, animated: true)
     }
    
    
    // MARK: -- 请求定位
    func requestLocation() {
        //判断定位服务是否开启
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            //#available用在条件语句代码块中，判断不同的平台下，做不同的逻辑处理.这里表示iOS 8及其以上系统运行
            if #available(iOS 8.0, *) {
            
                if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) ||
                    self.locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) {
                    if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil {
                         self.locationManager.requestAlwaysAuthorization()
                    }else if (Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil) {
                        self.locationManager.requestWhenInUseAuthorization()
                    }else{
                        WFLog("Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription")
                    }
                }
            }else{
                WFLog("iOS 8.0 以下系统")
            }
            
            self.locationManager.startUpdatingLocation()
        }else{
            WFLog("定位未开启")
        }
    }

}


extension TestMapViewController: MKMapViewDelegate {
    
    //地图的显示区域即将发生改变的时候调用
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
    }
     
    //地图的显示区域已经发生改变的时候调用
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    
    }
     
    //地图控件即将开始加载地图数据
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        
    }
    
    //当MKMapView加载数据完成时激发该方法
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        
        
    }
    
    //当MKMapView加载数据失败时激发该方法如：无网络
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        
    }
    
    //当MKMapView即将开始渲染地图时激发该方法
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {

    }
    
    //当MKMapView渲染地图完成时激发该方法
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
    }
    
    //当大头针被添加到地图上时调用
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
    }
    
    //当点击左边或者右边附属视图的时候方法被调用
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
    }
    
    //点击选中大头针
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    
    }
    
    //当大头针被反选，即取消选中的时候调用，可以通过该方法改变选中大头针视图的姿态
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    
    }
    
    //当showsUserLocation属性被设置为true，该方法会被调用，即将开始跟踪定位用户位置
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        WFLog("停止跟踪用户的位置")
    }
    
    //当用户位置发生变化时调用,调用非常频繁，不断监测用户的当前位置,每次调用，都会把用户的最新位置（userLocation参数）传进来。
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        addAnnotaionToMapView(coorinate2D: userLocation.coordinate)

    }
    
    
    
    //无法定位或者用户不允许定位时，即定位失败，触发代理方法
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        
    }
    
    //当拖动大头针的姿态改变的时候触发代理方法
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        
    }
    
    //当用户的跟踪模式改变会触发代理方法
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        
    }
    
    
    
    // MARK: -- 添加一个大头针
    func addAnnotaionToMapView(coorinate2D: CLLocationCoordinate2D) {
        
        //创建MKPointAnnotation对象——代表一个大头针
        let pointAnnotation: MKPointAnnotation = MKPointAnnotation()
        //设置大头针的经纬度
        pointAnnotation.coordinate = coorinate2D
        pointAnnotation.title = "Jack"
        pointAnnotation.subtitle = "hua"
        //添加大头针
        self.mapView.addAnnotation(pointAnnotation)
        
        //设置地图显示的范围，地图显示范围越小，细节越清楚
        let span = MKCoordinateSpan(latitudeDelta:0.005, longitudeDelta:0.005)
        //创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。
        let region = MKCoordinateRegion(center: coorinate2D, span: span)
        //设置当前地图的显示中心和显示范围
        self.mapView.setRegion(region, animated:true)

    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MKPinAnnotationView"
        //从缓存池中取出可以循环利用的大头针view.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            
            //MKAnnotationView：可以用指定的图片作为大头针的样式，但显示的时候没有动画效果，如果没有给图片的话会什么都不显示,使用MKAnnotationView子类MKPinAnnotationView创建系统样式大头针
            annotationView =  MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            //显示子标题和标题
            annotationView!.canShowCallout = true
            //设置大头针描述的偏移量
            annotationView!.calloutOffset = CGPoint(x:0, y: -10)
            //设置大头针描述左边的控件
            annotationView!.leftCalloutAccessoryView = UIButton(type: .contactAdd)
            //设置大头针描述右边的控件
            annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            // 设置大头针的图片
//            annotationView?.image = UIImage.init(named: "point_map")
            
        }
        annotationView!.annotation = annotation

        return annotationView
    }
    
}


extension TestMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation: CLLocation! = locations[locations.count - 1]
        self.initialLocation = currentLocation
        if currentLocation.horizontalAccuracy > 0 {
            self.locationManager.stopUpdatingLocation()
        }
    }
}
