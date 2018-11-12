//
//  MapClusterContainer.swift
//  HouseRent
//
//  Created by liuhongli on 2018/11/5.
//  Copyright © 2018年 HouseRent. All rights reserved.
//

import UIKit
import AMapSearchKit

protocol SWMapClusterContainerDelegate {
    func sw_map_cluster_action(sender: SWMapButton)
}

class MapClusterContainer: UIView,MAMapViewDelegate, AMapSearchDelegate {
    var delegate: SWMapClusterContainerDelegate!
    var mapView: MAMapView!
    var annotation: MAAnnotation?
    /// 聚合点
    var coordinateQuadTree = CoordinateQuadTree()
    var selectedPoiArray = [Any]()
    var shouldRegionChangeReCalculate: Bool = false
    var overlay: MAMultiPointOverlay!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        clusterPointSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupUI() {
        mapView = MAMapView.init(frame: self.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        self.addSubview(mapView)
        
        mapView.showsUserLocation = true
        
        mapView.userTrackingMode = .follow
        self.mapView.centerCoordinate = CLLocationCoordinate2D.init(latitude: 39.474923, longitude: 116.027116)
        
        
    }
    func clusterPointSettings () {
        var pois = [ClusterAnnotation]()
        
        for _ in 0..<100 {
            let lat = CGFloat.randomFloat(lo: 0, hi: 1) + 39.474923
            let lon = CGFloat.randomFloat(lo: 0, hi: 1) + 116.027116
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
            
            let poi = ClusterAnnotation()
            poi.title = "方恒国际"
            poi.subtitle = "阜通东大街6号"
            poi.coordinate = coordinate
            
            poi.address = "中关村鼎好"
            
            poi.price = "100"
            poi.imgUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541847757240&di=a27196f973200fab471336bd689075e7&imgtype=0&src=http%3A%2F%2Fcdnq.duitang.com%2Fuploads%2Fitem%2F201401%2F29%2F20140129213948_LBasc.thumb.224_0.jpeg"
            
            
            pois.append(poi)
        }
        print("pois===\(pois)")
        DispatchQueue.global(qos: .default).async(execute: { [weak self] in
            self?.coordinateQuadTree.build(withPOIs: pois)
            self?.shouldRegionChangeReCalculate = true
            self?.addAnnotations(toMapView: (self?.mapView)!)
        })
    }
    
    func mapViewRegionChanged(_ mapView: MAMapView!) {
        self.addAnnotations(toMapView: self.mapView)
    }
    
    func addAnnotations(toMapView mapView: MAMapView) {
        guard (self.coordinateQuadTree.root != nil) || self.shouldRegionChangeReCalculate != false else {
            NSLog("tree is not ready.")
            return
        }
        guard let aMapView = self.mapView else {
            return
        }
        let visibleRect = aMapView.visibleMapRect
        let zoomScale = Double(aMapView.bounds.size.width) / visibleRect.size.width
        let zoomLevel = Double(aMapView.zoomLevel)
        DispatchQueue.global(qos: .default).async(execute: { [weak self] in
            let annotations = self?.coordinateQuadTree.clusteredAnnotations(within: visibleRect, withZoomScale: zoomScale, andZoomLevel: zoomLevel)
            self?.updateMapViewAnnotations(annotations: annotations as! Array<ClusterAnnotation>)
        })
    }
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is ClusterAnnotation {
            
            if annotation.isKind(of: MAUserLocation.self) {
                return nil
            }
            
            let customReuseIndetifier: String = "customReuseIndetifier"
            /// 注册 annotationView
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: customReuseIndetifier) as? SWCustomMapView
            let clusterAnnotation = annotation as? ClusterAnnotation
            if annotationView == nil && clusterAnnotation?.pois != nil && clusterAnnotation?.pois.count != 0 {
                /// 创建 annotationView
                annotationView = SWCustomMapView.init(annotation: annotation, reuseIdentifier: customReuseIndetifier)
                annotationView?.canShowCallout = false
                annotationView?.isDraggable = true
                annotationView?.annotation = clusterAnnotation
                annotationView?.delegate = self
                /// 给模型赋值
                let coordinate: CLLocationCoordinate2D = clusterAnnotation?.coordinate ?? CLLocationCoordinate2D.init(latitude: 39.474923, longitude: 116.027116)
                let annoCount: Int = clusterAnnotation?.count ?? 0
                let pois = clusterAnnotation?.pois as! [ClusterAnnotation]
                let model = SWAnnotationModel.init(coordinate: coordinate, count: annoCount, pois: pois)
                annotationView?.btn.annotationModel = model
            }
            return annotationView
        }
        return nil
    }
    
    func updateMapViewAnnotations(annotations: Array<ClusterAnnotation>) {
        /* 用户滑动时，保留仍然可用的标注，去除屏幕外标注，添加新增区域的标注 */
        let before = NSMutableSet(array: mapView.annotations)
        before.remove(mapView.userLocation)
        let after: Set<NSObject> = NSSet(array: annotations) as Set<NSObject>
        /* 保留仍然位于屏幕内的annotation. */
        var toKeep: Set<NSObject> = NSMutableSet(set: before) as Set<NSObject>
        toKeep = toKeep.intersection(after)
        /* 需要添加的annotation. */
        let toAdd = NSMutableSet(set: after)
        toAdd.minus(toKeep)
        /* 删除位于屏幕外的annotation. */
        let toRemove = NSMutableSet(set: before)
        toRemove.minus(after)
        DispatchQueue.main.async(execute: { [weak self] () -> Void in
            self?.mapView.addAnnotations(toAdd.allObjects)
            self?.mapView.removeAnnotations(toRemove.allObjects)
        })
    }
}

/// 点击聚合点会触发的代理方法
extension MapClusterContainer: SWCustomMapViewDelegate {
    func sw_custom_map_action(sender: SWMapButton) {
        self.delegate.sw_map_cluster_action(sender: sender)
    }
}

public extension CGFloat {
    public static func randomFloat(lo: CGFloat = 0,hi: CGFloat = 1) -> CGFloat {
        return (CGFloat(arc4random()) / CGFloat(UInt32.max)) * (hi - lo) + lo
    }
}

