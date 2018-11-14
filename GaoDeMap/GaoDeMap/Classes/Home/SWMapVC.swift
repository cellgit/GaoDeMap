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
    
    let KSWMapCell = "SWMapCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Gaode Map"
        tableViewData()
    }
    
    override func tableViewData() {
        
        let subtitle0 = "当地图上需要展示的marker过多，可能会导致界面上marker压盖、性能变差。使用点聚合功能，则可以解决该问题。"
        
        let data0 = SWTableViewDataStruct.init(title: "Cluster: 聚合点", subtitle: subtitle0, identifier: KGaoDeMapIdentifier)
        
        
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
        
        cell.delegate = self
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}


extension SWMapVC: SWMapCellDelegate {
    func sw_action(sender: UIButton, identifier: String) {
        switch identifier {
        case "SWClusterIdentifier":
            let vc = GaodeOrgWebViewController.init(identifier: identifier)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = GaodeOrgWebViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
