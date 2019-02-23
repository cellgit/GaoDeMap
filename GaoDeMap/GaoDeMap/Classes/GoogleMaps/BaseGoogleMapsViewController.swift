//
//  BaseGoogleMapsViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2019/2/23.
//  Copyright © 2019 lhl. All rights reserved.
//

import UIKit
import GoogleMaps

class BaseGoogleMapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMap()
    }
    

    func setupMap() {
//        let mapView = MAMapView(frame: self.view.bounds)
//        self.view.addSubview(mapView)
        
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 39.56, longitude: 116.20, zoom: 11.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 39.56, longitude: 116.20)
        marker.title = "北京"
        marker.snippet = "中国"
        marker.map = mapView
    }

}
