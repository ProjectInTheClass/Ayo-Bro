//
//  KakaoMapViewController.swift
//  Ayo~Bro
//
//  Created by GW_13 on 02/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class KakaoMapViewController: UIViewController, MTMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MTMapView?
    var mapMarker: MTMapPOIItem?
    var mapPoint: MTMapPoint?
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        mapMarker = MTMapPOIItem()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //사용할때만 위치정보를 사용한다는 팝업
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate
        let coorLatitude = 37.619675//coor!.latitude
        let coorLongitude = 127.059803//coor!.longitude
        mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: coorLatitude, longitude: coorLongitude))
        //mapView?.setMapCenter(mapPoint!, animated: true)
        mapView?.setMapCenter(mapPoint, zoomLevel: 0, animated: true)
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
        //  print("latitude" + String(coor!.latitude) + "/ longitude" + String(coor!.longitude))
        
        //latitude: 37.619675, longitude: 127.059803
        var items = [MTMapPOIItem]()
        items.append(poiItem(name: "현재위치", latitude: coorLatitude, longitude: coorLongitude))
        
        //위 부분은 viewDidLoad()에서 수행해도 괜찮습니다
        
        mapView?.addPOIItems(items) // 지도에 마커 표시
        //        mapView?.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
        
    }
    
    //마커
    //    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
    //        let item = MTMapPOIItem()
    //        item.itemName = name
    //        item.markerType = .redPin
    //        item.markerSelectedType = .redPin
    //        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
    //        item.showAnimationType = .noAnimation
    //        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
    //
    //        return item
    //    }
    
    
    //커스텀 마커
    func poiItem(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let poiItem = MTMapPOIItem()
        poiItem.itemName = name
        poiItem.markerType = .customImage                           //커스텀 타입으로 변경
        poiItem.customImage = UIImage(named: "sunglassPoliItem")        //커스텀 이미지 지정
        poiItem.markerSelectedType = .customImage                   //선택 되었을 때 마커 타입
        poiItem.customSelectedImage = UIImage(named: "sunglassPoliItem")    //선택 되었을 때 마커 이미지 지정
        poiItem.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        poiItem.showAnimationType = .noAnimation
        poiItem.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)
        
        return poiItem
    }
    
    
}
