//
//  RecipeIngredientsMO+CoreDataProperties.swift
//  FoodPin
//
//  Created by Alex on 18.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipeIngredientsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeIngredientsMO> {
        return NSFetchRequest<RecipeIngredientsMO>(entityName: "RecipeIngredients")
    }

    @NSManaged public var recipeID: Int16
    @NSManaged public var ingredientID: NSObject?

}

extension RecipeIngredientsMO : Identifiable {

}
