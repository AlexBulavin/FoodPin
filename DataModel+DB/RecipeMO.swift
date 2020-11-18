//
//  RecipeMO+CoreDataClass.swift
//  FoodPin
//
//  Created by Alex on 18.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


public class RecipeMO: NSManagedObject {

}

extension RecipeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeMO> {
        return NSFetchRequest<RecipeMO>(entityName: "Recipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var recipeCategory: String?
    @NSManaged public var cookingDeviceType: String?
    @NSManaged public var cookingDeviceBrand: String?
    @NSManaged public var cookingDeviceModel: String?
    @NSManaged public var image: Data?
    @NSManaged public var recipeBrief: String?
    @NSManaged public var recipeCookingTime: Int32
    @NSManaged public var recipeNumberOfPortions: Int16
    @NSManaged public var recipeCalories: Double
    @NSManaged public var recipeProteins: Double
    @NSManaged public var recipeFat: Double
    @NSManaged public var recipeCarbons: Double
    @NSManaged public var recipeGlicemicIndex: Double
    @NSManaged public var recipeAuthorLocations: String?
    @NSManaged public var recipeType: String?
    @NSManaged public var ingredients: Int32
    @NSManaged public var isLiked: Bool
    @NSManaged public var recipeRating: String?

}

extension RecipeMO : Identifiable {

}
