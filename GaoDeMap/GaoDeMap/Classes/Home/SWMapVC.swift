//
//  SWMapVC.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/10.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class SWMapVC: SWBaseTableViewController {
    
    let KBaseMapIdentifier = "BaseMapIdentifier"
    let KClusterIdentifier = "ClusterIdentifier"
    
    
    let KSWMapCell = "SWMapCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gaode Map"
        tableViewData()
    }
    
    override func registerCell() {
        let arrayM = [KSWMapCell]
        for str in arrayM {
            self.tableView.register(UINib(nibName:str, bundle:nil), forCellReuseIdentifier:str)
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataList.isEmpty {
            let cell = UITableViewCell.init()
            cell.isHidden = true
            return cell
        }
        let cell: SWMapCell = tableView.dequeueReusableCell(withIdentifier: KSWMapCell, for: indexPath) as! SWMapCell
        cell.model = dataList[indexPath.row]
        cell.identifier = dataList[indexPath.row].identifier
        cell.delegate = self
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
    override func tableViewData() {
        
//        let subtitle0 = "当地图上需要展示的marker过多，可能会导致界面上marker压盖、性能变差。使用点聚合功能，则可以解决该问题。"
        
//        let data0 = SWTableViewDataStruct.init(title: "Cluster: 聚合点", subtitle: subtitle0, identifier: KClusterIdentifier)
        
        let subtitle0 = "实例化地图对象,显示地图。"
        
        let data0 = SWTableViewDataStruct.init(title: "Map: 显示地图", subtitle: subtitle0, identifier: KBaseMapIdentifier)
        
        
        self.dataList = [data0]
    }
}


extension SWMapVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = UIViewController.init()
        switch dataList[indexPath.row].identifier {
        case KBaseMapIdentifier:
            vc = BaseMapViewController.init()
        case KClusterIdentifier:
            vc = MapClusterViewController.init()
        default:
            vc = MapClusterViewController.init()
        }
        pushViewController(vc: vc, animated: true)
    }
}

extension SWMapVC: SWMapCellDelegate {
    /// 高德官方实现
    func sw_org_action(sender: UIButton, identifier: String) {
        var vc = UIViewController.init()
        
        switch identifier {
        case KBaseMapIdentifier:
            vc = GaodeOrgWebViewController.init(identifier: identifier)
        case KClusterIdentifier:
            vc = GaodeOrgWebViewController.init(identifier: identifier)
        default:
            vc = GaodeOrgWebViewController()
        }
        
        self.pushViewController(vc: vc, animated: true)
    }
    
    /// 本 app 实现
    func sw_code_action(sender: UIButton, identifier: String) {
        var vc = UIViewController.init()
        //https://github.com/cellgit/GaoDeMap/blob/master/GaoDeMap/GaoDeMap/Classes/Resource/001ShowMap.md
        switch identifier {
        case KBaseMapIdentifier:
            vc = CodeWebViewController.init(identifier: identifier)
        case KClusterIdentifier:
            vc = GaodeOrgWebViewController.init(identifier: identifier)
        default:
            vc = GaodeOrgWebViewController()
        }
        
        self.pushViewController(vc: vc, animated: true)
    }
    
    
}
