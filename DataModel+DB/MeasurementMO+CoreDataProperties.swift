//
//  MeasurementMO+CoreDataProperties.swift
//  FoodPin
//
//  Created by Alex on 18.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension MeasurementMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeasurementMO> {
        return NSFetchRequest<MeasurementMO>(entityName: "Measurement")
    }

    @NSManaged public var measurement: String?

}

extension MeasurementMO : Identifiable {

}
