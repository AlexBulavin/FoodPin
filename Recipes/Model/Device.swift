//
//  Device.swift
//  FoodPin
//
//  Created by Alex on 11.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//


class Device {
    var deviceType = ""
    var deviceUserName = ""
    var deviceBrand = ""
    var deviceModel = ""
    var deviceImage = ""
    var isSelected = false
    
    init (deviceType: String, deviceUserName: String, deviceBrand: String, deviceModel: String, deviceImage: String, isSelected: Bool) {
        self.deviceType = deviceType
        self.deviceUserName = deviceUserName
        self.deviceBrand = deviceBrand
        self.deviceModel = deviceModel
        self.deviceImage = deviceImage
        self.isSelected = isSelected
        
    }
    
    convenience init() {
        self.init(deviceType: "", deviceUserName: "", deviceBrand: "", deviceModel: "", deviceImage: "", isSelected: false)
    }
}
