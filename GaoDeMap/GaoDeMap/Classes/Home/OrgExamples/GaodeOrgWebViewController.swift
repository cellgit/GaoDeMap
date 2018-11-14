//
//  GaodeOrgWebViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/13.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import WebKit

class GaodeOrgWebViewController: UIViewController {
    
    /// 显示地图
    let KBaseMapIdentifier = "BaseMapIdentifier"
    /// iOS 点聚合
    let KClusterIdentifier = "ClusterIdentifier"
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var urlStr: String = ""
    
    var identifier: String = ""
    
    
    convenience init(identifier: String) {
        self.init()
        
        self.identifier = identifier
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI(identifier: identifier)
    }


    func setupUI(identifier: String) {
        
        switch identifier {
            
        case KBaseMapIdentifier:
            urlStr = "https://lbs.amap.com/api/ios-sdk/guide/create-map/show-map"
        case KClusterIdentifier:
            urlStr = "https://lbs.amap.com/dev/demo/cluster-marker#iOS"
        default:
            // 高德开放平台主页
            urlStr = "https://lbs.amap.com"
        }
        
        let url:URL = URL.init(string: urlStr)!
        webView.load(URLRequest(url: url))
    }

}
