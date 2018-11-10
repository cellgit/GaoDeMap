//
//  SWMapVC.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/10.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class SWMapVC: SWBaseTableViewController {
    
    let KGaoDeMapIdentifier = "GaoDeMapIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gaode Map"
        tableViewData()
    }
    
    override func tableViewData() {
        let data0 = SWTableViewDataStruct.init(title: "GaoDe Map", identifier: KGaoDeMapIdentifier)
        
        self.dataList = [data0]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = UIViewController.init()
        switch dataList[indexPath.row].identifier {
        case KGaoDeMapIdentifier:
            vc = MapClusterViewController.init()
        default:
            vc = MapClusterViewController.init()
        }
        
        pushViewController(vc: vc, animated: true)
        
    }
}
