//
//  KakaoMapViewController.swift
//  Ayo~Bro
//
//  Created by GW_13 on 02/08/2019.
//  Copyright © 2019 GW_19. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, MTMapViewDelegate {
    var mapView: MTMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
    }
}

