//
//  Device.swift
//  FoodPin
//
//  Created by Alex on 11.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import UIKit

class Device {
    var deviceType = ""
    var deviceUserName = ""
    var deviceImage = ""
    var isSelected = false
    
    init (deviceType: String, deviceUserName: String, deviceImage: String, isSelected: Bool) {
        self.deviceType = deviceType
        self.deviceUserName = deviceUserName
        self.deviceImage = deviceImage
        self.isSelected = isSelected
        
    }
    
    convenience init() {
        self.init(deviceType: "", deviceUserName: "", deviceImage: "", isSelected: false)
    }
}
