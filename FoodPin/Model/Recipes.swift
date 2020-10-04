//
//  Recipes.swift
//  FoodPin
//
//  Created by Alex on 20.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

class Recipes {
    var recipeNames: String
    var recipeImages: String
    var recipeDescription: String
    var recipeAuthorLocations: String
    var recipeType: String
    var recipeIngredients: String
    var recipeIsLiked: Bool
    var recipeRating: String

    init(name: String, image: String, description: String, recipeAuthorLocations: String, recipeType: String, ingredients: String, isLiked: Bool, recipeRating: String) {
        self.recipeNames = name
        self.recipeDescription = description
        self.recipeType = recipeType
        self.recipeAuthorLocations = recipeAuthorLocations
        self.recipeImages = image
        self.recipeIngredients = ingredients
        self.recipeIsLiked = isLiked
        self.recipeRating = recipeRating
    }

    convenience init() {
        self.init(name: "", image: "", description: "", recipeAuthorLocations: "", recipeType: "", ingredients: "", isLiked: false, recipeRating: "*")
    }
}
