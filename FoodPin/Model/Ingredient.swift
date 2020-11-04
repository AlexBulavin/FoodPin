//
//  Ingredient.swift
//  FoodPin
//
//  Created by Alex on 04.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

//import Foundation
//import UIKit

class Ingredient {
    var ingredientName = ""
    var ingredientProteins = 00.00
    var ingredientFat = 00.00
    var ingredientCarbons = 00.00
    var ingredientGlicemicIndex = 00.00
    var ingredientUserName = ""
    var ingredientImage = ""
    var isSelected = false
    
    init (ingredientName: String, ingredientProteins: Float, ingredientFat: Float, ingredientCarbons: Float, ingredientGlicemicIndex: Float,  ingredientUserName: String, ingredientImage: String, isSelected: Bool) {
        self.ingredientName = ingredientName
        self.ingredientUserName = ingredientUserName
        self.ingredientImage = ingredientImage
        self.isSelected = isSelected
        
    }
    
    convenience init() {
        self.init(ingredientName: "", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false)
    }
}


