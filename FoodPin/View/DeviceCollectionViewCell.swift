//
//  DeviceTableViewCell.swift
//  Recipes
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

protocol DeviceCollectionCellDelegate {
    func didDeviceButtonPressed(cell: DeviceCollectionViewCell)
}
class DeviceCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var DeviceImageView: UIImageView! {
        didSet {
            DeviceImageView.layer.cornerRadius = 8.0
            DeviceImageView.clipsToBounds = true
        }
    }
    var delegate: DeviceCollectionCellDelegate?
    
    @IBOutlet var deviceClickButton: UIButton!
    
    @IBAction func deviceButtonTapped(sender: AnyObject) {
        delegate?.didDeviceButtonPressed(cell: self)
    }
    
    @IBOutlet var DeviceType: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    var isTaped:Bool = false  {
        didSet {
            if isTaped {
                deviceClickButton.setImage(UIImage(named: "selectionContur"), for: .normal) //Если выбран прибор, то на кнопке под ним отображаем контурную иконку выбора.
                //Иконки selectionContur на 11.10.2020 нет
            } else {
                deviceClickButton.setImage(UIImage(named: ""), for: .normal) //Если прибор не выбран, то на кнопке под ним ничего не отображаем
            }
        }
    }
    
}
