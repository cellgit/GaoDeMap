//
//  SWCustomMapView.swift
//  HLTools
//
//  Created by liuhongli on 2018/10/23.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit


protocol SWCustomMapViewDelegate {
    func sw_custom_map_action(sender: SWMapButton)
}

class SWCustomMapView: MAAnnotationView {

    var delegate: SWCustomMapViewDelegate!
    
    let btnW: CGFloat = 73
    let btnH: CGFloat = 73
    var btn: SWMapButton!
    
    convenience override init(annotation: MAAnnotation, reuseIdentifier: String) {
        self.init()
        self.bounds = CGRect(x: 0, y: 0, width: btnW, height: btnH)
        self.layer.cornerRadius = btnW / 2
        self.clipsToBounds = true
        self.backgroundColor = UIColor.init(red: 254.0/255.0, green: 172.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        
        btn = SWMapButton.init(type: .custom)
        
        self.addSubview(btn)
        btn.frame = CGRect(x: 0, y: 0, width: btnW, height: btnH)
        btn.annotation = annotation
        
        btn.addTarget(self, action: #selector(evt_custom_map_action(sender:)), for: .touchUpInside)
    }
    
    /// 点击聚合点触发 btn 的 action
    @objc func evt_custom_map_action(sender: SWMapButton) {
        delegate.sw_custom_map_action(sender: sender)
        
        print("经度: \(sender.annotation.coordinate.longitude),纬度: \(sender.annotation.coordinate.latitude), model.count === \(sender.annotationModel.pois[0].address ?? "")")
    }

}



