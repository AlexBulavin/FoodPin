//
//  DeviceTableViewCell.swift
//  Recipes
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    
    @IBOutlet var DeviceImageView: UIImageView! {
        didSet {
            DeviceImageView.layer.cornerRadius = 8.0
            DeviceImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet var DeviceType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
