//
//  MapContainerView.swift
//  HouseRent
//
//  Created by liuhongli on 2018/10/29.
//  Copyright © 2018年 HouseRent. All rights reserved.
//

import UIKit
import AMapSearchKit

class MapContainerView: UIView, MAMapViewDelegate {
    
    var viewController : MapClusterViewController!
    var clusterMapView: MapClusterContainer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMap()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}

/// setupMap
extension MapContainerView: SWMapClusterContainerDelegate { //,SWCustomMapViewDelegate
    
    
    func setupMap() {
        clusterMapView = MapClusterContainer.init(frame: self.frame)
        self.addSubview(clusterMapView)
        clusterMapView.delegate = self
    }
    
    func offsetToContainRect(innerRect: CGRect, outerRect: CGRect) -> CGSize {
        let nudgeRight: CGFloat = CGFloat.maximum(0, outerRect.minX - innerRect.minX)
        let nudgeLeft: CGFloat = CGFloat.minimum(0, outerRect.maxX - innerRect.maxX)
        let nudgeTop: CGFloat = CGFloat.maximum(0, outerRect.minY - innerRect.minY)
        let nudgeBottom: CGFloat = CGFloat.minimum(0, outerRect.maxY - innerRect.maxY)
        return CGSize.init(width: nudgeLeft == 0 ? 0 : nudgeRight , height: nudgeTop == 0 ? 0: nudgeBottom)
    }
    
    func sw_map_cluster_action(sender: SWMapButton) {
        print("longitude==== : \(sender.annotation.coordinate.longitude)")
        
    }
}







