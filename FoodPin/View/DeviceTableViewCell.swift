//
//  DeviceTableViewCell.swift
//  Recipes
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit


class DeviceTableViewCell: UITableViewCell {
   //(deviceType: "", deviceUserName: "", deviceBrand: "", deviceModel: "", deviceImage: "", isSelected: false)
    var deviceSelected: [Device] = [
        Device(deviceType: "deviceType1", deviceUserName: "deviceUserName1", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "cafedeadend", isSelected: false),
        Device(deviceType: "deviceType2", deviceUserName: "deviceUserName2", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "homei", isSelected: false),
        Device(deviceType: "deviceType3", deviceUserName: "deviceUserName3", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "teakha", isSelected: false),
        Device(deviceType: "deviceType4", deviceUserName: "deviceUserName4", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "cafeloisl", isSelected: false),
        Device(deviceType: "deviceType5", deviceUserName: "deviceUserName5", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "petiteoyster", isSelected: false),
        Device(deviceType: "deviceType6", deviceUserName: "deviceUserName6", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "forkeerestaurant", isSelected: false),
        Device(deviceType: "deviceType7", deviceUserName: "deviceUserName7", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "bourkestreetbakery", isSelected: false),
        Device(deviceType: "deviceType8", deviceUserName: "deviceUserName8", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "haighschocolate", isSelected: false),
        Device(deviceType: "deviceType9", deviceUserName: "deviceUserName9", deviceBrand: "Redmond", deviceModel: "RMC-M800S", deviceImage: "palominoespresso", isSelected: false),
    ]

    
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deviceCollectionView.register(DeviceCollectionViewCell.nib(), forCellWithReuseIdentifier: DeviceCollectionViewCell.identifier)
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self
        let _: () = print("\(#file) Функция \(#function ) строка \(#line) строка \(#line)")

       }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//         //Configure the view for the selected state
//    }
    
    static let identifier = "DeviceTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "DeviceTableViewCell",
                     bundle: nil)
    }
    
    func configure(with models: [Device]) {
        self.deviceSelected = models
        deviceCollectionView.reloadData()
    }
    
}

extension DeviceTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { //print("DeviceTableViewCell строка 47")
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { print("\(#file) Функция \(#function ) строка \(#line) количество элементов в коллекции \(deviceSelected.count)")
        return deviceSelected.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("\(#file) Функция \(#function ) строка \(#line)")
        let cell = deviceCollectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCell", for: indexPath) as! DeviceCollectionViewCell
        print("\(#file) Функция \(#function ) строка \(#line) \(cell)")
        // Configure the cell
        
        cell.DeviceImageView?.image = UIImage(named: deviceSelected[indexPath.row].deviceImage)
        print("\(#file) Функция \(#function ) строка \(#line)")
        cell.DeviceType?.text = deviceSelected[indexPath.row].deviceUserName
        print("\(#file) Функция \(#function ) строка \(#line) \(cell)")
        collectionView.reloadData() //в соответствии с рекомендациями: перезагрузил данные https://coderoad.ru/48672335/Как-сделать-видимой-пользовательскую-ячейку-collectionview
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
