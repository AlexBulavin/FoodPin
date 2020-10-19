//
//  DeviceCollectionViewCell.swift
//  Recipes
//
//  Created by Alex on 18.10.2020.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var DeviceType: UILabel!
    @IBOutlet  var DeviceImageView: UIImageView! {
        didSet {
        DeviceImageView.layer.cornerRadius = 8.0
        DeviceImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet var deviceClickButton: UIButton!
    
    @IBAction func deviceButtonTapped(sender: AnyObject)
    {

        var isTaped:Bool = false  {
            didSet {
                if isTaped {
                    deviceClickButton.setImage(UIImage(named: "heart-tick"), for: .normal) //Если выбран прибор, то на кнопке под ним отображаем контурную иконку выбора.
                    //Иконки selectionContur на 11.10.2020 нет
                } else {
                    deviceClickButton.setImage(UIImage(named: ""), for: .normal) //Если прибор не выбран, то на кнопке под ним ничего не отображаем
                }
            }
        }

    }
    
}
