//
//  BaseMapViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/14.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class BaseMapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
    }
    
    func setupMap() {
        let mapView = MAMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
    }
}
