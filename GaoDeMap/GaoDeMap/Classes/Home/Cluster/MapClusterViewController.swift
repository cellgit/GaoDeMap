//
//  MapClusterViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/10.
//  Copyright © 2018 lhl. All rights reserved.
//

/*
 这个类是 聚合点 示例的入口, j将 TheMap文件夹直接拖进项目即可(保证SDK和桥接文件正常)
 */


import UIKit

class MapClusterViewController: UIViewController {
    
    var containerView: MapContainerView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        if self.containerView != nil {
            self.containerView.clusterMapView.mapView.reloadMap()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Cluster: 聚合点"
        
        setupUI()
    }
    
    func setupUI() {
        self.containerView = MapContainerView.init(frame: self.view.frame)
        self.containerView.viewController = self
        self.view.addSubview(self.containerView)
    }
}

extension  MapClusterViewController: SWCustomMapViewDelegate {
    func sw_custom_map_action(sender: SWMapButton) {
        print("longitude==== : \(sender.annotation.coordinate.longitude)")
    }
}
