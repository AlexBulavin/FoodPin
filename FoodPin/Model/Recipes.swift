//
//  Recipes.swift
//  FoodPin
//
//  Created by Alex on 20.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

//import Foundation

class Recipes {
    var recipeName: String
    var recipeCategory: String
    var cookingDeviceType: String
    var cookingDeviceBrand: String
    var cookingDeviceModel: String
    var recipeImage: String
    var recipeBrief: String
    var recipeCookingTime: Int //Время готовки нужно задавать в миллисекундах
    var recipeNumberOfPortions: Int
    var recipeCalories = 00.00
    var recipeProteins = 00.00
    var recipeFat = 00.00
    var recipeCarbons = 00.00
    var recipeGlicemicIndex = 00.00
    var recipeAuthorLocations: String
    var recipeType: String
    var recipeIngredients: [String]
    var recipeIsLiked: Bool
    var recipeRating: String
    
    init(
        name: String,
        recipeCategory: String,
        cookingDeviceType: String,
        cookingDeviceBrand: String,
        cookingDeviceModel: String,
        image: String,
        recipeBrief: String,
        recipeCookingTime: Int,
        recipeNumberOfPortions: Int,
        recipeCalories: Double,
        recipeProteins: Double,
        recipeFat: Double,
        recipeCarbons: Double,
        recipeGlicemicIndex: Double,
        recipeAuthorLocations: String,
        recipeType: String,
        ingredients: [String],
        isLiked: Bool,
        recipeRating: String)
    {
        self.recipeName = name
        self.recipeCategory = recipeCategory
        self.cookingDeviceType = cookingDeviceType
        self.cookingDeviceBrand = cookingDeviceBrand
        self.cookingDeviceModel = cookingDeviceModel
        self.recipeImage = image
        self.recipeBrief = recipeBrief
        self.recipeCookingTime = recipeCookingTime
        self.recipeNumberOfPortions = recipeNumberOfPortions
        self.recipeCalories = recipeCalories
        self.recipeProteins = recipeProteins
        self.recipeFat = recipeFat
        self.recipeCarbons = recipeCarbons
        self.recipeGlicemicIndex = recipeGlicemicIndex
        self.recipeType = recipeType
        self.recipeAuthorLocations = recipeAuthorLocations
        self.recipeIngredients = ingredients
        self.recipeIsLiked = isLiked
        self.recipeRating = recipeRating
    }
    
    convenience init() {
        self.init(
            name: "",
            recipeCategory: "",
            cookingDeviceType: "",
            cookingDeviceBrand: "",
            cookingDeviceModel: "",
            image: "", recipeBrief: "",
            recipeCookingTime: 0,
            recipeNumberOfPortions: 0,
            recipeCalories: 00.00,
            recipeProteins: 00.00,
            recipeFat: 00.00,
            recipeCarbons: 00.00,
            recipeGlicemicIndex: 00.00,
            recipeAuthorLocations: "",
            recipeType: "",
            ingredients: ["",""],
            isLiked: false,
            recipeRating: "*")
    }
}
