//
//  MapHouseListModel.swift
//  HouseRent
//
//  Created by liuhongli on 2018/10/29.
//  Copyright © 2018年 HouseRent. All rights reserved.
//

import UIKit

class MapHouseListModel: NSObject {
    /// 房源坐标
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 39.474923, longitude: 116.027116)
    /// 封面图
    var imgUrl: String = ""
    /// 价格
    var price: String = ""
    /// 地址
    var address: String = ""
    /// 楼层
    var floor: String = ""
    /// 标题
    var title: String = ""
    /// 子标题
    var subtitle: String = ""
    
    /// 房源数量: 添加属性
    var count: Int = 0
}




