//
//  SWAnnotationModel.swift
//  HouseRent
//
//  Created by liuhongli on 2018/11/10.
//  Copyright © 2018年 HouseRent. All rights reserved.
//

import UIKit



struct SWAnnotationModel {
    
    /// average coordinate of pois : pois 的平均坐标
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 39.474923, longitude: 116.027116)
    
    /// amount of poi : pois 集合中包含的 poi 数量
    var count: Int = 0
    
    /// array of poi 的集合 : poi 的集合,  注: ClusterAnnotation 的 title 表示标题, subtitle:子标题
    var pois = [ClusterAnnotation]()
}
