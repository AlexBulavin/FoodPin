//
//  DeviceMO+CoreDataProperties.swift
//  FoodPin
//
//  Created by Alex on 18.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension DeviceMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeviceMO> {
        return NSFetchRequest<DeviceMO>(entityName: "Device")
    }

    @NSManaged public var deviceType: String?
    @NSManaged public var deviceUserName: String?
    @NSManaged public var deviceBrand: String?
    @NSManaged public var deviceModel: String?
    @NSManaged public var deviceImage: Data?
    @NSManaged public var deviceIsSelected: Bool
    @NSManaged public var deviceID: Int16

}

extension DeviceMO : Identifiable {

}
