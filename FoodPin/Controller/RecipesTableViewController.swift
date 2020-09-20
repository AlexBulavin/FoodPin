//
//  RecipesTableViewController.swift
//  FoodPin
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var recipes:[Recipes] = [
    Recipes(name: "Сырники из творога", image: "cafedeadend", description: "Главный секрет идеальных сырников — а точнее творожников, — творог нужно протереть через мелкое сито и отжать от влаги. Жирность предпочтительна не больше и не меньше 9%. Тесто должно получиться эластичным, чтобы при надавливании сырник не треснул на сковородке, а сохранил форму. Если все сделать правильно, получатся нежные однородные кругляшки под плотной румяной корочкой. Сырники можно запекать в духовке или готовить на пару. В рецепте не исключаются эксперименты с начинкой — сухофрукты, орехи, свежие фрукты и даже картофель лишними не будут. 1. Положите весь творог в кастрюльку и разомните его вилкой так, чтобы в нем не осталось крупных комков. Разбейте в него яйца, всыпьте сахар и тщательно все перемешайте. Лучше не использовать слишком сухой или слишком влажный творог, иначе сырники будут разваливаться в процессе приготовления.", recipeAuthorLocations: "Hong Kong", recipeType: "Чешская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Спагетти карбонара с красным луком", image: "homei", description: "Рецепт 3 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Итальянская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Классическая шарлотка", image: "teakha", description: "Рецепт 3 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Итальянская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Тонкие блины на молоке", image: "cafeloisl", description: "Рецепт 4 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Американская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),

    Recipes(name: "Лазанья классическая с мясом", image: "petiteoyster", description: "Рецепт 5 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Азиатская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
    
    Recipes(name: "Азу по‑татарски", image: "forkeerestaurant", description: "Рецепт 6 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Мексиканская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Po's Atelier", image: "posatelier", description: "Рецепт 7 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Турецкая", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Bourke Street Bakery", image: "bourkestreetbakery", description: "Рецепт 8 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Английская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Haigh's Chocolate", image: "haighschocolate", description: "Рецепт 9 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Русская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Palomino Espresso", image: "palominoespresso", description: "Рецепт 10 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Французская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Upstate", image: "upstate", description: "Рецепт 11 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Украинская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Graham Avenue Meats", image: "traif", description: "Рецепт 12 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Китайская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Waffle & Wolf", image: "grahamavenuemeats", description: "Рецепт 13 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Японская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Five Leaves", image: "wafflewolf", description: "Рецепт 14 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Еврейская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Cafe Lore", image: "fiveleaves", description: "Рецепт 15 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Европейская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Confessional", image: "cafelore", description: "Рецепт 16 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Немецкая", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Barrafina", image: "confessional", description: "Рецепт 17 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Грузинская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Donostia", image: "barrafina", description: "Рецепт 18 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Ингдийская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "Royal Oak", image: "royaloak", description: "Рецепт 19 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Корейская", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
        
    Recipes(name: "CASK Pub and Kitchen", image: "caskpubkitchen", description: "Рецепт 20 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", recipeAuthorLocations: "Где-то на белом свете", recipeType: "Греческая", ingredients: "Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек, Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", isLiked: false),
    ]
   
    
    // MARK: - Готовим segue и перебрасываем в него данные
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RecipeDetailViewController
                destinationController.recipe = recipes[indexPath.row]

            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeTableViewCell
        // Configure the cell...
        cell.nameLabel?.text = recipes[indexPath.row].recipeNames
        cell.thumbnailImageView?.image = UIImage(named: recipes[indexPath.row].recipeImages)
        cell.locationLabel?.text = recipes[indexPath.row].recipeAuthorLocations
        cell.typeLabel?.text = recipes[indexPath.row].recipeType
       
        
        cell.heartImageView.isHidden = !self.recipes[indexPath.row].recipeIsLiked
                
        return cell }
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count }
    
    // MARK: - View controller life cycle»
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true //Для корректного отображения ячеек на планшетах.
        navigationController?.navigationBar.prefersLargeTitles = true //Чтобы отображать заголовок в NavigationBar крупно. По умолчанию он стоит мелкий.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")//.destructive style, indicating that the button should be in red.
        { (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.recipes.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)//Удаление конкретной строки с анимацией .fade
            //Также возможны .right , .left , and .top
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Поделиться") { (action, sourceView, completionHandler) in
            let defaultText = "Рекомендую попробовать:" + "\n" + self.recipes[indexPath.row].recipeNames + "\n" + "Кухня: " + self.recipes[indexPath.row].recipeType + "\n" + "Автор рецепта: " + self.recipes[indexPath.row].recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n" + self.recipes[indexPath.row].recipeDescription + "\n\n" + "Состав блюда:" + "\n" + self.recipes[indexPath.row].recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https://apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
            
            let activityController: UIActivityViewController
            
            if let defaultPicture = UIImage(named: self.recipes[indexPath.row].recipeImages)
            { activityController = UIActivityViewController(activityItems: [ defaultText, defaultPicture], applicationActivities: nil) }
            else
            { activityController = UIActivityViewController(activityItems: [ defaultText], applicationActivities: nil) }
            
            if let popoverController = activityController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath) { popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                } }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 48.0/255.0, green: 48.0/255.0 , blue: 75.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.title = "Удалить"
        shareAction.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkAction = UIContextualAction(style: .normal, title: "Выбрать")
        { (action, sourceView, completionHandler) in
           
            let cell = tableView.cellForRow(at: indexPath) as? RecipeTableViewCell
            
            cell?.heartImageView.isHidden = self.recipes[indexPath.row].recipeIsLiked
            
            self.recipes[indexPath.row].recipeIsLiked = self.recipes[indexPath.row].recipeIsLiked ? false : true
            
            completionHandler(true)
        }
        checkAction.image = (checkAction.image != nil) ? UIImage(systemName: "checkmark") : UIImage(systemName: "arrow.uturn.left")
        checkAction.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0)

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkAction])
        return swipeConfiguration
        
    }
}


