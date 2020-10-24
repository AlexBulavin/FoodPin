//
//  DeviceTableViewCell.swift
//  Recipes
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit


class DeviceTableViewCell: UITableViewCell {
   
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

    
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self
     let pr = print("DeviceTableViewCell  deviceCollectionView.delegate", deviceCollectionView.delegate, "deviceCollectionView.dataSource", deviceCollectionView.dataSource)
           super.awakeFromNib()
           // Initialization code

       }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//         //Configure the view for the selected state
//    }
    
    
}

extension DeviceTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int { //print("DeviceTableViewCell строка 47")
//        return 1
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { print("DeviceTableViewCell строка 54 \(deviceSelected.count)")
        
        return deviceSelected.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("DeviceTableViewCell строка 60")
        let cell = deviceCollectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCell", for: indexPath) as! DeviceCollectionViewCell
        print("DeviceTableViewCell строка 62 \(cell)")
        // Configure the cell
        
        cell.DeviceImageView?.image = UIImage(named: deviceSelected[indexPath.row].deviceImage)
        print("DeviceTableViewCell строка 66")
        cell.DeviceType?.text = deviceSelected[indexPath.row].deviceUserName
        print("DeviceTableViewCell строка 68 \(cell)")
        //cell.deviceButtonTapped = deviceSelected[indexPath.row].isSelected
//        var isTaped:Bool = false  {
//            didSet {
//                print("DeviceTableViewCell строка 67")
//                if isTaped {
//                    cell.deviceClickButton.setImage(UIImage(named: "heart-tick"), for: .normal) //Если выбран прибор, то на кнопке под ним отображаем контурную иконку выбора.
//                    print("DeviceTableViewCell строка 70")
//                    deviceSelected[indexPath.row].isSelected = true
//                    print("DeviceTableViewCell строка 72")
//                    //Иконки selectionContur на 11.10.2020 нет
//                } else {
//                    print("DeviceTableViewCell строка 75")
//                    cell.deviceClickButton.setImage(UIImage(named: ""), for: .normal) //Если прибор не выбран, то на кнопке под ним ничего не отображаем
//                    print("DeviceTableViewCell строка 77")
//                    deviceSelected[indexPath.row].isSelected = false
//                    print("DeviceTableViewCell строка 79")
//                }
//            }
//        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let bounds = collectionView.bounds

            return CGSize(width: bounds.width/9, height: 80)
            }

    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        return CGSize(width: 80, height: 80)
    //        }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 8
            }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8
            }

        return cell
    }

}
