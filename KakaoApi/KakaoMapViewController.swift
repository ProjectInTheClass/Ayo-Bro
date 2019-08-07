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

class ViewController: UIViewController, MTMapViewDelegate, CLLocationManagerDelegate {
    var mapView: MTMapView?
    var mapMarker: MTMapPOIItem?
    var mapPoint: MTMapPoint?
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        mapMarker = MTMapPOIItem()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let coor = locationManager.location?.coordinate
    
        mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.619666, longitude: 127.059685))
        mapView?.setMapCenter(mapPoint!, animated: true)
    
        
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
        
            print ("asd: ", coor?.latitude, coor?.longitude)
        
    }
}
