//
//  DeviceTableViewCell.swift
//  Recipes
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

//protocol DeviceCollectionCellDelegate {
//    func didDeviceButtonPressed(cell: DeviceCollectionViewCell)
//}
class DeviceCollectionViewCell: UITableViewCell{ //UICollectionViewCell { //}
    
    var deviceSelected: [Device] = [
        Device(deviceType: "deviceType1", deviceUserName: "deviceUserName1", deviceImage: "cafedeadend", isSelected: false),
        Device(deviceType: "deviceType2", deviceUserName: "deviceUserName2", deviceImage: "homei", isSelected: false),
        Device(deviceType: "deviceType3", deviceUserName: "deviceUserName3", deviceImage: "teakha", isSelected: false),
        Device(deviceType: "deviceType4", deviceUserName: "deviceUserName4", deviceImage: "cafeloisl", isSelected: false),
        Device(deviceType: "deviceType5", deviceUserName: "deviceUserName5", deviceImage: "petiteoyster", isSelected: false),
        Device(deviceType: "deviceType6", deviceUserName: "deviceUserName6", deviceImage: "forkeerestaurant", isSelected: false),
        Device(deviceType: "deviceType7", deviceUserName: "deviceUserName7", deviceImage: "bourkestreetbakery", isSelected: false),
        Device(deviceType: "deviceType8", deviceUserName: "deviceUserName8", deviceImage: "haighschocolate", isSelected: false),
        Device(deviceType: "deviceType9", deviceUserName: "deviceUserName9", deviceImage: "palominoespresso", isSelected: false),
    ]
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var DeviceImageView: UIImageView! {
        didSet {
            DeviceImageView.layer.cornerRadius = 8.0
            DeviceImageView.clipsToBounds = true
        }
    }
    //var delegate: DeviceCollectionCellDelegate?
    
    @IBOutlet var deviceClickButton: UIButton!
    
    @IBAction func deviceButtonTapped(sender: AnyObject) {
        //delegate?.didDeviceButtonPressed(cell: self)
    }
    
    @IBOutlet var DeviceType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         //Configure the view for the selected state
    }
    
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
extension DeviceCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deviceSelected.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCell", for: indexPath)

        // Configure the cell
//        cell.DeviceImageView?.image = UIImage(named: deviceSelected[indexPath.row].deviceImage)
//        cell.DeviceType?.text = deviceSelected[indexPath.row].deviceUserName
        //cell.isTaped = deviceSelected[indexPath.row].isSelected
        //cell.delegate = self

        return cell
    }



}
