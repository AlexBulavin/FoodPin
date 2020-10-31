//
//  RecipesTableViewController.swift
//  FoodPin
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreBluetooth

class RecipesTableViewController: UITableViewController {
   
    
    @IBOutlet var mainScreenTableView: UITableView!

    var indexPathLocal = 0
    
    var recipes:[Recipes] = [
        Recipes(name: "Сырники из творога", image: "cafedeadend", description: "Главный секрет идеальных сырников — а точнее творожников, — творог нужно протереть через мелкое сито и отжать от влаги. Жирность предпочтительна не больше и не меньше 9%. Тесто должно получиться эластичным, чтобы при надавливании сырник не треснул на сковородке, а сохранил форму. Если все сделать правильно, получатся нежные однородные кругляшки под плотной румяной корочкой. Сырники можно запекать в духовке или готовить на пару. В рецепте не исключаются эксперименты с начинкой — сухофрукты, орехи, свежие фрукты и даже картофель лишними не будут. \n 1. Положите весь творог в кастрюльку и разомните его вилкой так, чтобы в нем не осталось крупных комков. Разбейте в него яйца, всыпьте сахар и тщательно все перемешайте. Лучше не использовать слишком сухой или слишком влажный творог, иначе сырники будут разваливаться в процессе приготовления.", recipeAuthorLocations: "64/28 пр.Металлистов, Санкт-Петербург, 196175", recipeType: "Чешская", ingredients: "Творог 500 г,\n Куриное яйцо 2 штуки,\n Пшеничная мука 6 столовых ложек,\n Сахар 2 столовые ложки,\n Подсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Спагетти карбонара с красным луком", image: "homei", description: "Рецепт 2 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "д.44, Свердловская наб., Санкт-Петербург, 195027", recipeType: "Итальянская", ingredients: "Творог 500 г,\n Куриное яйцо 2 штуки,\n Пшеничная мука 6 столовых ложек,\n Сахар 2 столовые ложки,\n Подсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(name: "Классическая шарлотка", image: "teakha", description: "Рецепт 3 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "д.38 ул.Промышленная, Санкт-Петербург, 198095", recipeType: "Итальянская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Тонкие блины на молоке", image: "cafeloisl", description: "Рецепт 4 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Красная площадь, Москва", recipeType: "Американская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Лазанья классическая с мясом", image: "petiteoyster", description: "Рецепт 5 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Пекин, Китай", recipeType: "Азиатская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Азу по‑татарски", image: "forkeerestaurant", description: "Рецепт 6 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Рим, Италия", recipeType: "Мексиканская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Po's Atelier", image: "posatelier", description: "Рецепт 7 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Афины, Греция", recipeType: "Турецкая", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(name: "Bourke Street Bakery", image: "bourkestreetbakery", description: "Рецепт 8 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Нью-Йорк, США", recipeType: "Английская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Haigh's Chocolate", image: "haighschocolate", description: "Рецепт 9 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Берлин Германия", recipeType: "Русская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Palomino Espresso", image: "palominoespresso", description: "Рецепт 10 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Париж, Франция", recipeType: "Французская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(name: "Upstate", image: "upstate", description: "Рецепт 11 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Лиссобон, Португалия", recipeType: "Украинская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Graham Avenue Meats", image: "traif", description: "Рецепт 12 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Мадрид, Испания", recipeType: "Китайская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Waffle & Wolf", image: "grahamavenuemeats", description: "Рецепт 13 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Дели, Индия", recipeType: "Японская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Five Leaves", image: "wafflewolf", description: "Рецепт 14 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Сидней, Автсралия", recipeType: "Еврейская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Cafe Lore", image: "fiveleaves", description: "Рецепт 15 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Вашингтон, США", recipeType: "Европейская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Confessional", image: "cafelore", description: "Рецепт 16 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Гавана, Куба", recipeType: "Немецкая", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★★⭐︎"),
        
        Recipes(name: "Barrafina", image: "confessional", description: "Рецепт 17 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Улан-Батор, Монголия", recipeType: "Грузинская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★⭐︎⭐︎"),
        
        Recipes(name: "Donostia", image: "barrafina", description: "Рецепт 18 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Токио, Япония", recipeType: "Ингдийская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★⭐︎⭐︎⭐︎⭐︎"),
        
        Recipes(name: "Royal Oak", image: "royaloak", description: "Рецепт 19 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Краснодар, Россия", recipeType: "Корейская", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★⭐︎⭐︎⭐︎"),
        
        Recipes(name: "CASK Pub and Kitchen", image: "caskpubkitchen", description: "Рецепт 20 \n1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. \n2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Екатеринбург, Россия", recipeType: "Греческая", ingredients: "Творог 500 г, \nКуриное яйцо 2 штуки, \nПшеничная мука 6 столовых ложек, \nСахар 2 столовые ложки, \nПодсолнечное масло 5 столовых ложек", isLiked: false, recipeRating: "★★★⭐︎⭐︎"),
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
        //collectionView.backgroundColor = UIColor.clear
        
        
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
}

extension RecipesTableViewController {
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("\(#file) Функция \(#function ) строка \(#line) \n")
//        print("")
//        return 10}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        indexPathLocal = indexPath.row - 1 //Ловим номер элемента массива
//        print("RecipesTableViewController строка 117 ловим номер элемента массива ")
//        print(indexPathLocal)
        
        switch indexPath.row {
        
        case 0:
            
            guard let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell
            
            else {fatalError("Невозможно создать ячейку DeviceTableViewCell \(#line)") }
            let _: () = print("\(#file) Функция \(#function ) строка \(#line) вошли в case = 0 создание коллекции")
            
            return cell
            
        case 1...:

            let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RecipeTableViewCell
            // Configure the cell...
            cell.nameLabel?.text = recipes[indexPathLocal].recipeNames
            cell.thumbnailImageView?.image = UIImage(named: recipes[indexPathLocal].recipeImages)
            cell.locationLabel?.text = recipes[indexPathLocal].recipeRating
            cell.typeLabel?.text = recipes[indexPathLocal].recipeType
            cell.heartImageView.isHidden = !self.recipes[indexPathLocal].recipeIsLiked

            cell.selectionStyle = .none
            
//            pr = print("RecipesTableViewController строка \(#line) dataCell \(cell)")
//            pr = print(cell)
            
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
//            let defaultText = "Рекомендую попробовать:" + "\n" + self.recipes[indexPath.row].recipeNames + "\n" + "Кухня: " + self.recipes[indexPath.row].recipeType + "\n" + "Автор рецепта: " + self.recipes[indexPath.row].recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n" + self.recipes[indexPath.row].recipeDescription + "\n\n" + "Состав блюда:" + "\n" + self.recipes[indexPath.row].recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https:apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
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


