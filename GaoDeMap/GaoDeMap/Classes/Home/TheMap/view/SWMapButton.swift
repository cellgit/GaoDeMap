//
//  SWMapButton.swift
//  HLTools
//
//  Created by liuhongli on 2018/10/23.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit



class SWMapButton: UIButton {
    var annotation: MAAnnotation!
    
    let btnW: CGFloat = 73
    let btnH: CGFloat = 73
    let labelH: CGFloat = 20
    
    var nameLabel: UILabel!
    var subnameLabel: UILabel!
    
    var annotationModel = SWAnnotationModel() {
        didSet {
            subnameLabel.text = String(describing: annotationModel.count)
            
            if annotationModel.pois.count > 1 {
                /// 大于1显示商圈
                nameLabel?.text = annotationModel.pois.first?.title
            }
            else {
                /// 等于1显示楼盘
                nameLabel?.text = annotationModel.pois.first?.subtitle
            }
        }
    }
    
    //MARK:- 重写init函数
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(type: UIButton.ButtonType) {
        self.init()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        self.addSubview(containerView)
        containerView.isUserInteractionEnabled = false
        
        let offset_Y: CGFloat = 8
        
        let titleLabel = UILabel.init()
        containerView.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: offset_Y, width: btnW, height: labelH)
        titleLabel.text = ""
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        
        let subtitleLabel = UILabel.init()
        containerView.addSubview(subtitleLabel)
        subtitleLabel.frame = CGRect(x: 0, y: 2 * offset_Y + labelH, width: btnW, height: labelH)
        subtitleLabel.text = ""
        subtitleLabel.numberOfLines = 1
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        
        self.nameLabel = titleLabel
        self.subnameLabel = subtitleLabel
    }

}
