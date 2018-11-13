//
//  OrgClusterShowingViewController.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/13.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import WebKit

class OrgClusterShowingViewController: UIViewController {
    
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
        case "SWClusterIdentifier":
            urlStr = "https://lbs.amap.com/dev/demo/cluster-marker#iOS"
        default:
            urlStr = "https://lbs.amap.com/dev/demo/cluster-marker#iOS"
        }

        let url:URL = URL.init(string: urlStr)!
        webView.load(URLRequest(url: url))
    }

    

}
