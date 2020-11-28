//
//  IngredientsDBMO+CoreDataProperties.swift
//  FoodPin
//
//  Created by Alex on 18.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension IngredientsDBMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientsDBMO> {
        return NSFetchRequest<IngredientsDBMO>(entityName: "IngredientsDB")
    }

    @NSManaged public var ingredientName: String?
    @NSManaged public var ingredientProteins: Double
    @NSManaged public var ingredientFat: Double
    @NSManaged public var ingredientCarbons: Double
    @NSManaged public var ingredientGlicemicIndex: Double
    @NSManaged public var ingredientUserName: String?
    @NSManaged public var ingredientImage: Data?
    @NSManaged public var isSelected: Bool
    @NSManaged public var ingredientID: Int16

}

extension IngredientsDBMO : Identifiable {

}
