//
//  RecipesTableViewController.swift
//  FoodPin
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreData

class RecipesTableViewController: UITableViewController {
   
    
    @IBOutlet var mainScreenTableView: UITableView!

    var indexPathLocal = 0
    /* name: "",
     recipeCategory: "",
     cookingDeviceType: "",
     cookingDeviceBrand: "",
     cookingDeviceModel: "",
     image: "",
     recipeBrief: "",
     recipeCookingTime: 0,
     recipeNumberOfPortions: 0,
     recipeCalories: 00.00,
     recipeProteins: 00.00,
     recipeFat: 00.00,
     recipeCarbons: 00.00,
     recipeGlicemicIndex: 00.00,
     recipeAuthorLocations: "",
     recipeType: "",
     ingredients: [""],
     isLiked: false,
     recipeRating: "*")*/
   // var maesurementInRecipes: MeasurementTable
    //var ingredients: [String]
    var ingredientFromRecipe: [Ingredient] = [
        Ingredient(ingredientName: "Творог", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false),
        Ingredient(ingredientName: "Куриное яйцо", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false),
        Ingredient(ingredientName: "Пшеничная мука", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false),
        Ingredient(ingredientName: "Сахар", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false),
        Ingredient(ingredientName: "Подсолнечное масло", ingredientProteins: 00.00, ingredientFat: 00.00, ingredientCarbons: 00.00, ingredientGlicemicIndex: 00.00, ingredientUserName: "", ingredientImage: "", isSelected: false)
    ]
    var recipes: [RecipeMO] = []
    var addRecipes:RecipeMO!
    var recipeDefault:[Recipes] = [
        Recipes(
                name: "Сырники из творога",
                recipeCategory: "semi-product",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M800S",
                image: "cafedeadend",
                recipeBrief: "Главный секрет идеальных сырников — а точнее творожников, — творог нужно протереть через мелкое сито и отжать от влаги. Жирность предпочтительна не больше и не меньше 9%. Тесто должно получиться эластичным, чтобы при надавливании сырник не треснул на сковородке, а сохранил форму. Если все сделать правильно, получатся нежные однородные кругляшки под плотной румяной корочкой. Сырники можно запекать в духовке или готовить на пару. В рецепте не исключаются эксперименты с начинкой — сухофрукты, орехи, свежие фрукты и даже картофель лишними не будут. \n 1. Положите весь творог в кастрюльку и разомните его вилкой так, чтобы в нем не осталось крупных комков. Разбейте в него яйца, всыпьте сахар и тщательно все перемешайте. Лучше не использовать слишком сухой или слишком влажный творог, иначе сырники будут разваливаться в процессе приготовления.",
                recipeCookingTime: 1800000, //30 минут в миллисекундах 30' = 30 * 60" * 1000 = 1 800 000
                recipeNumberOfPortions: 2,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "64/28 пр.Металлистов, Санкт-Петербург, 196175",
                recipeType: "Чешская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"], //[ingredientFromRecipe[0].ingredientName, ingredientFromRecipe[2].ingredientName], "Творог 500 г,\n Куриное яйцо 2 штуки,\n Пшеничная мука 6 столовых ложек,\n Сахар 2 столовые ложки,\n Подсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(
                name: "Спагетти карбонара с красным луком",
                recipeCategory: "main course",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M802S",
                image: "homei",
                recipeBrief: "Рецепт 2 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 1600000,
                recipeNumberOfPortions: 4,
                recipeCalories: 320.00,//кКал/100гр.
                recipeProteins: 23.00,//гр./100гр.
                recipeFat: 10.00,//гр./100гр.
                recipeCarbons: 50.00,//гр./100гр.
                recipeGlicemicIndex: 5.00,//гр./100гр.
                recipeAuthorLocations: "64/28 пр.Металлистов, Санкт-Петербург, 196175",
                recipeType: "Чешская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(
                name: "Классическая шарлотка",
                recipeCategory: "main course",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M801S",
                image: "teakha",
                recipeBrief: "Рецепт 3 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "д.38 ул.Промышленная, Санкт-Петербург, 198095",
                recipeType: "Итальянская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(
                name: "Тонкие блины на молоке",
                recipeCategory: "dinner",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M803S",
                image: "cafeloisl",
                recipeBrief: "Рецепт 4 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Красная площадь, Москва",
                recipeType: "Американская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★★★⭐︎"),
        
        Recipes(
                name: "Лазанья классическая с мясом",
                recipeCategory: "breakfast",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M805S",
                image: "petiteoyster",
                recipeBrief: "Рецепт 5 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Красная площадь, Москва",
                recipeType: "Американская",
                recipeAuthorLocations: "Пекин, Китай",
                recipeType: "Азиатская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(
                name: "Азу по‑татарски",
                recipeCategory: "breakfast",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M808S",
                image: "forkeerestaurant",
                recipeBrief: "Рецепт 6 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Рим, Италия",
                recipeType: "Мексиканская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★⭐︎⭐︎⭐︎"),
        
            Recipes(
                name: "Po's Atelier",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M806S",
                image: "posatelier",
                recipeBrief: "Рецепт 7 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Афины, Греция",
                recipeType: "Турецкая",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(
                name: "Bourke Street Bakery",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "bourkestreetbakery",
                recipeBrief: "Рецепт 8 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Нью-Йорк, США",
                recipeType: "Английская",
                ingredients: ["Творог", "Куриное яйцо", "Пшеничная мука", "Сахар", "Подсолнечное масло"],
                isLiked: false,
                recipeRating: "★★★★⭐︎"),
        
        Recipes(
                name: "Haigh's Chocolate",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "haighschocolate",
                recipeBrief: "Рецепт 9 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Берлин Германия",
                recipeType: "Русская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★⭐︎⭐︎⭐︎"),

        Recipes(
                name: "Palomino Espresso",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "palominoespresso",
                recipeBrief: "Рецепт 10 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Париж, Франция",
                recipeType: "Французская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★⭐︎⭐︎"),

        Recipes(
                name: "Upstate",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "upstate",
                recipeBrief: "Рецепт 11 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Лиссобон, Португалия",
                recipeType: "Украинская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★★⭐︎"),

        Recipes(
                name: "Graham Avenue Meats",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "traif",
                recipeBrief: "Рецепт 12 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Мадрид, Испания",
                recipeType: "Китайская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),

        Recipes(
                name: "Waffle & Wolf",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "grahamavenuemeats",
                recipeBrief: "Рецепт 13 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Дели, Индия",
                recipeType: "Японская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★★⭐︎"),

        Recipes(
                name: "Five Leaves",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "wafflewolf",
                recipeBrief: "Рецепт 14 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Сидней, Автсралия",
                recipeType: "Еврейская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★⭐︎⭐︎⭐︎"),

        Recipes(
                name: "Cafe Lore",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "fiveleaves",
                recipeBrief: "Рецепт 15 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Вашингтон, США",
                recipeType: "Европейская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★★⭐︎"),

        Recipes(
                name: "Confessional",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "cafelore",
                recipeBrief: "Рецепт 16 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Гавана, Куба",
                recipeType: "Немецкая",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★★⭐︎"),

        Recipes(
                name: "Barrafina",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "confessional",
                recipeBrief: "Рецепт 17 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Улан-Батор, Монголия",
                recipeType: "Грузинская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★⭐︎⭐︎"),

        Recipes(
                name: "Donostia",
                recipeCategory: "lunch",
                cookingDeviceType: "multicooker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMC-M807S",
                image: "barrafina",
                recipeBrief: "Рецепт 18 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Токио, Япония",
                recipeType: "Ингдийская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),

        Recipes(
                name: "Royal Oak",
                recipeCategory: "dinner",
                cookingDeviceType: "airgrill",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RAG-2410",
                image: "royaloak",
                recipeBrief: "Рецепт 19 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Краснодар, Россия",
                recipeType: "Корейская",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★⭐︎⭐︎⭐︎"),

        Recipes(
                name: "CASK Pub and Kitchen",
                recipeCategory: "brekfast",
                cookingDeviceType: "multibaker",
                cookingDeviceBrand: "REDMOND",
                cookingDeviceModel: "RMB-M603",
                image: "caskpubkitchen",
                recipeBrief: "Рецепт 20 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.",
                recipeCookingTime: 2600000,
                recipeNumberOfPortions: 3,
                recipeCalories: 300.00,//кКал/100гр.
                recipeProteins: 25.00,//гр./100гр.
                recipeFat: 15.00,//гр./100гр.
                recipeCarbons: 80.00,//гр./100гр.
                recipeGlicemicIndex: 3.00,//гр./100гр.
                recipeAuthorLocations: "Екатеринбург, Россия",
                recipeType: "Греческая",
                ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек",
                isLiked: false,
                recipeRating: "★★★⭐︎⭐︎")
    ]
    
    
    // MARK: - Готовим segue и перебрасываем в него данные
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RecipeDetailViewController
                destinationController.recipe = recipes[indexPath.row-1]
                
            }
        }
    }
    
    
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true //Для корректного отображения ячеек на планшетах.
        navigationController?.navigationBar.prefersLargeTitles = true //Чтобы отображать заголовок в NavigationBar крупно. По умолчанию он стоит мелкий.
        
        //Customizing the Navigation Bar. Customizing the background of the navigation bar and make it transparent.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor(red: 90.0 / 255.0, green: 45.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0), NSAttributedString.Key.font: customFont ]
        }
        
        navigationController?.hidesBarsOnSwipe = true
        mainScreenTableView.register(DeviceTableViewCell.nib(), forCellReuseIdentifier: DeviceTableViewCell.identifier)
        
        //collectionView.backgroundColor = UIColor.clear
        mainScreenTableView.delegate = self
        mainScreenTableView.dataSource = self
        
        // MARK: - Uplode data from restaurantDefault[] array to the DB if there is no data
        
        if recipes.count == 0 {
            
            print("\(#file) Функция \(#function ) строка \(#line)")
            for index in 0 ... recipeDefault.count - 1
            {
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    addRecipes = RecipeMO(context: appDelegate.persistentContainer.viewContext)
                    //                  restaurants = [RestaurantMO(context: appDelegate.persistentContainer.viewContext)] //Заготовка для перехода к работе с массивом.
                    //                  restaurants[index+1].name = restaurantDefault[index].name
                    //                  addRecipes.name = recipeDefault[index].name
                    //                  addRecipes.recipeCategory = recipeDefault[index].recipeCategory
                    //                  addRecipes.cookingDeviceType = recipeDefault[index].cookingDeviceType
                    //                  addRecipes.cookingDeviceBrand = recipeDefault[index].cookingDeviceBrand
                    //                  addRecipes.cookingDeviceModel = recipeDefault[index].cookingDeviceModel
                    //                  addRecipes.image = UIImage(named: recipeDefault[index].image)?.pngData()//.pngData()
                    //                  addRecipes.recipeBrief = recipeDefault[index].recipeBrief
                    //                  addRecipes.recipeCookingTime = recipeDefault[index].recipeCookingTime
                    //                  addRecipes.recipeNumberOfPortions = recipeDefault[index].recipeNumberOfPortions
                    //                  addRecipes.recipeCalories = recipeDefault[index].recipeCalories
                    //                  addRecipes.recipeProteins = recipeDefault[index].recipeProteins
                    //                  addRecipes.recipeFat = recipeDefault[index].recipeFat
                    //                  addRecipes.recipeCarbons = recipeDefault[index].recipeCarbons
                    //                  addRecipes.recipeGlicemicIndex = recipeDefault[index].recipeGlicemicIndex
                    //                  addRecipes.recipeAuthorLocations = recipeDefault[index].recipeAuthorLocations
                    //                  addRecipes.recipeType = recipeDefault[index].recipeType
                    //                  addRecipes.ingredients = recipeDefault[index].ingredients
                    //                  addRecipes.isLiked = recipeDefault[index].isLiked
                    //                  addRecipes.recipeRating = recipeDefault[index].recipeRating
                    //                     recipeID: Int16
                    
                    
                    print("Saving data from restaurantDefault to context for \(String(describing: addRecipes.name))")
                    appDelegate.saveContext()
                }
                
            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        UIApplication.shared.statusBarStyle = .darkContent
        
        tableView.reloadData()//Для того, чтобы после возврата из контроллера детализации (при изменении рейтинга) обновить показатели рейтинга на главном экране.

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}

extension RecipesTableViewController {
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(#file) Функция \(#function ) строка \(#line) \n")
        return recipes.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        indexPathLocal = indexPath.row - 1 //Ловим номер элемента массива
//        print("RecipesTableViewController строка 117 ловим номер элемента массива ")
//        print(indexPathLocal)
        
        switch indexPath.row {
        
        case 0:
            
            guard let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.identifier, for: indexPath) as? DeviceTableViewCell
            
            //cell.configure(with: DeviceCollectionViewCell)
            else {fatalError("Невозможно создать ячейку DeviceTableViewCell \(#line)") }
            let _: () = print("\(#file) Функция \(#function ) строка \(#line) вошли в case = 0 создание коллекции")

            
            return cell
            
        case 1:

            let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RecipeTableViewCell
            // Configure the cell...
            cell.nameLabel?.text = recipes[indexPathLocal].name
            
            //cell.thumbnailImageView?.image = UIImage(named: recipes[indexPathLocal].recipeImage)
            
            if let recpeImage = recipes[indexPath.row].image {
                cell.thumbnailImageView.image = UIImage(data: recpeImage as Data)
            }
            cell.locationLabel?.text = recipes[indexPathLocal].recipeRating
            cell.typeLabel?.text = recipes[indexPathLocal].recipeType
            cell.heartImageView.isHidden = !self.recipes[indexPathLocal].isLiked

            cell.selectionStyle = .none
            
            let _: () =  print("RecipesTableViewController строка \(#line) dataCell \(cell)")
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller. Если появляется эта ошибка, нужно проверить количество ячеек, которые мы хотим создать в файле RecipesTableViewController    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { сейчас там return recipes.count + 1 } То есть имеем первую ячейку для карусели девайсов, остальные для отображения рецептов.")
        }
    }

    
    // MARK: - Navigation
    
//    if indexPathLocal > 0 {
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete").destructive style, indicating that the button should be in red.
//        { (action, sourceView, completionHandler) in
//             Delete the row from the data source
//            self.recipes.remove(at: indexPath.row)
//            
//            self.tableView.deleteRows(at: [indexPath], with: .fade)Удаление конкретной строки с анимацией .fade
//            Также возможны .right , .left , and .top
//             Call completion handler to dismiss the action button
//            completionHandler(true)
//        }
//        let shareAction = UIContextualAction(style: .normal, title: "Поделиться") { (action, sourceView, completionHandler) in
//            let defaultText = "Рекомендую попробовать:" + "\n" + self.recipes[indexPath.row].recipeNames + "\n" + "Кухня: " + self.recipes[indexPath.row].recipeType + "\n" + "Автор рецепта: " + self.recipes[indexPath.row].recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n" + self.recipes[indexPath.row].recipeBrief + "\n\n" + "Состав блюда:" + "\n" + self.recipes[indexPath.row].recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https:apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
//            
//            let activityController: UIActivityViewController
//            
//            if let defaultPicture = UIImage(named: self.recipes[indexPath.row].recipeImages)
//            { activityController = UIActivityViewController(activityItems: [ defaultText, defaultPicture], applicationActivities: nil) }
//            else
//            { activityController = UIActivityViewController(activityItems: [ defaultText], applicationActivities: nil) }
//            
//            if let popoverController = activityController.popoverPresentationController{
//                if let cell = tableView.cellForRow(at: indexPath) { popoverController.sourceView = cell
//                    popoverController.sourceRect = cell.bounds
//                } }
//            
//            self.present(activityController, animated: true, completion: nil)
//            completionHandler(true)
//        }
//        
//        deleteAction.backgroundColor = UIColor(red: 48.0 / 255.0, green: 48.0 / 255.0, blue: 75.0 / 255.0, alpha: 1.0)
//        deleteAction.image = UIImage(systemName: "trash")
//        deleteAction.title = "Удалить"
//        shareAction.backgroundColor = UIColor(red: 90.0 / 255.0, green: 45.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
//        shareAction.image = UIImage(systemName: "square.and.arrow.up")
//        
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
//        
//        return swipeConfiguration
//        
//    }
//}
}
    /*
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkAction = UIContextualAction(style: .normal, title: "Выбрать")
        { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as? RecipeTableViewCell
            
            cell?.heartImageView.isHidden = self.recipes[indexPath.row].recipeIsLiked
            
            self.recipes[indexPath.row].recipeIsLiked = self.recipes[indexPath.row].recipeIsLiked ? false : true
            
            completionHandler(true)
        }
        checkAction.image = (checkAction.image != nil) ? UIImage(systemName: "checkmark") : UIImage(systemName: "arrow.uturn.left")
        checkAction.backgroundColor = UIColor(red: 90.0 / 255.0, green: 45.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0) //После добавления файла UIColor+Ext в Extension группе можно упростить код и вместо UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0) использовать эту запись
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkAction])
        return swipeConfiguration
        
    }
    */



//extension RecipesTableViewController: UIGestureRecognizerDelegate {
//
//    func handleSwipe(gesture: UISwipeGestureRecognizer) {
//        let point = gesture.location(in: self.collectionView)
//
//        if (gesture.state == UIGestureRecognizerState.ended) {
//            if let indexPath = collectionView.indexPathForItem(at: point) {
//                // Remove trip from Parse, array and collection view
//                deviceSelected[indexPath.row].toPFObject().deleteInBackground(block: { (success, error) -> Void in
//                    if (success) {
//                        print("Successfully removed the trip")
//                    } else {
//                        print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                        return
//                    }
//
//                    self.deviceSelected.remove(at: indexPath.row)
//                    self.collectionView.deleteItems(at: [indexPath])
//                })
//            }
//        }
//    }
//
//}


