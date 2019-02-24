//
//  BaseGoogleMapsViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2019/2/23.
//  Copyright © 2019 lhl. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class BaseGoogleMapsViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    // The currently selected place.
    var selectedPlace: GMSPlace?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMap()
        
        palaceSettings()
//        addMap()
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
    
    func palaceSettings() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
    }
    
//    func addMap() {
//        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
//                                              longitude: defaultLocation.coordinate.longitude,
//                                              zoom: zoomLevel)
//        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
//        mapView.settings.myLocationButton = true
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        //mapView.isMyLocationEnabled = true
//
//        // Add the map to the view, hide it until we've got a location update.
//        view.addSubview(mapView)
//        mapView.isHidden = true
//    }

}

extension BaseGoogleMapsViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
//        listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
