//
//  KakaoMapViewController.swift
//  Ayo~Bro
//
//  Created by 최세린 on 25/09/2019.
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
    var detailInfo : PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside!
    
//    var originData : PublicAPIResponse.HeaderWithBody.Body.Item.ItemInside?
//    var detailInfo: [PublicAPIResponseDetail.HeaderWithBody.Body.Item.ItemInside] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        mapMarker = MTMapPOIItem()
        locationManager.delegate = self
        if originData == nil {
            detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: homeContentId!).first!
        }
        else {
            let contentId = (originData?.contentid)!
            detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId).first!
        }
        
 //       let detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId).first
//        let detailInfo = sharedModelPublicAPIDetail.requestForDetail(contentId: contentId!).first
//        var coor = locationManager.location?.coordinate
        let coorLatitude = detailInfo.mapy
        let coorLongitude = detailInfo.mapx
        

        mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: coorLatitude, longitude: coorLongitude))
        mapView?.setMapCenter(mapPoint, zoomLevel: 2, animated: true)
        
        
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
        
        var items = [MTMapPOIItem]()
        items.append(poiItem(name: "장소", latitude: coorLatitude, longitude: coorLongitude))
        
        //위 부분은 viewDidLoad()에서 수행해도 괜찮습니다
        
        mapView?.addPOIItems(items) // 지도에 마커 표시
        
        
        //        mapView?.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
        
    }

    
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
    
    //
    
    
    
}


