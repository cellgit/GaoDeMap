//
//  UIViewController+Extension.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/10.
//  Copyright © 2018 lhl. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func pushViewController(vc: UIViewController, animated: Bool) {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
