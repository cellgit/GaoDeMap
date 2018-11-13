//
//  SWMapCell.swift
//  GaoDeMap
//
//  Created by 刘宏立 on 2018/11/13.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

protocol SWMapCellDelegate {
    func sw_action(sender: UIButton, identifier: String)
}


class SWMapCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var orgBtn: UIButton!
    
    var delegate: SWMapCellDelegate!
    
    
    var model = SWTableViewDataStruct() {
        didSet {
            titleLabel.text = model.title
            subtitleLabel.text = model.subtitle
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        orgBtn.layer.cornerRadius = orgBtn.bounds.height / 2
        orgBtn.clipsToBounds = true
        orgBtn.layer.borderWidth = 0.5
        orgBtn.layer.borderColor = UIColor.init(red: 0 / 255.0, green: 122.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        
        
        orgBtn.action { (sender) in
            self.delegate.sw_action(sender: sender, identifier: "SWClusterIdentifier")
        }
    }
    
    
    
}
