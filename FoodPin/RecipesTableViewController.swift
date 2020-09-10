//
//  RecipesTableViewController.swift
//  FoodPin
//
//  Created by Alex on 19.03.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var recipeNames = ["Сырники из творога", "Спагетти карбонара с красным луком", "Классическая шарлотка", "Тонкие блины на молоке", "Лазанья классическая с мясом", "Азу по‑татарски", "Po's Atelier", "Bourke Street Bakery" , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var recipeImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    var recipeDescription = ["Главный секрет идеальных сырников — а точнее творожников, — творог нужно протереть через мелкое сито и отжать от влаги. Жирность предпочтительна не больше и не меньше 9%. Тесто должно получиться эластичным, чтобы при надавливании сырник не треснул на сковородке, а сохранил форму. Если все сделать правильно, получатся нежные однородные кругляшки под плотной румяной корочкой. Сырники можно запекать в духовке или готовить на пару. В рецепте не исключаются эксперименты с начинкой — сухофрукты, орехи, свежие фрукты и даже картофель лишними не будут. 1. Положите весь творог в кастрюльку и разомните его вилкой так, чтобы в нем не осталось крупных комков. Разбейте в него яйца, всыпьте сахар и тщательно все перемешайте. Лучше не использовать слишком сухой или слишком влажный творог, иначе сырники будут разваливаться в процессе приготовления.", " 1. В кастрюлю на 3 литра положить мясо и налить воды. Как только бульон начнет кипеть, добавить 1 чайную ложку соли, пару горошков душистого перца и черного, 2–3 листика лаврового листа. Варить от момента закипания 20 минут. Затем мясо вынуть. 2. Картофель почистить и нарезать кубиками. Лук нарезать кубиками. Морковь натереть на терке. Мясо порезать небольшими кусочками. Плавленый сыр (если в виде брусочка) натереть на терке или порезать кубиками.", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery" , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var recipeAuthorLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Ko ng", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var recipeTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", " British", "Thai"]
    var recipeIngredients = ["Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу","Творог 500 г, Куриное яйцо 2 штуки, Пшеничная мука 6 столовых ложек,     Сахар 2 столовые ложки, Подсолнечное масло 5 столовых ложек", "Куриное филе 500 г, Плавленый сыр 200 г, Картофель 400 г, Лук 150 г,        Морковь 180 г, Сливочное масло по вкусу, Соль по вкусу, Молотый черный перец по вкусу, Зелень по вкусу, Лавровый лист 3 штуки, Гренки по вкусу, Черный перец горошком 2 штуки", "Спагетти 250 г, Сливочное масло 20 г, Чеснок 2 зубчика, Красный лук 1 головка, Бекон 50 г, Сливки 20%-ные 200 мл, Тертый сыр пармезан 50 г, Куриное яйцо 4 штуки, Соль по вкусу, Молотый черный перец по вкусу"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RecipeDetailViewController
                destinationController.recipeImageName = recipeImages[indexPath.row]
                destinationController.recipeName = recipeNames[indexPath.row]
                destinationController.recipeDescription = recipeDescription[indexPath.row]
                destinationController.ingredients = recipeIngredients[indexPath.row]
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeTableViewCell
        // Configure the cell...
        cell.nameLabel?.text = recipeNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: recipeImages[indexPath.row])
        cell.locationLabel?.text = recipeAuthorLocations[indexPath.row]
        cell.typeLabel?.text = recipeTypes[indexPath.row]
        //        if restaurantIsVisited[indexPath.row] { cell.accessoryType = .checkmark
        //        } else {
        //            cell.accessoryType = .none
        //        } //Альтернативная форма оператора cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        cell.heartImageView.isHidden = !self.restaurantIsVisited[indexPath.row]
        
        // tableView.separatorStyle = UITableViewCell.SeparatorStyle(rawValue: 0)! //Избавляемся от сепаратора между ячейками. Это же сделано в Storyboard через атрибут сепаратора
        
        return cell }
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeNames.count }
    
   /* Перенести action sheet на экран детализации
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath
        : IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "Что Вы хотите сделать?", preferredStyle: .actionSheet) //.alert) это опциональное оформление сообщения. Алерт или actionSheet
        optionMenu.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0) //Изменить цвет текста сообщения на фирменный 90;45;128
        optionMenu.view.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет фона сообщения
        if let popoverController = optionMenu.popoverPresentationController { if let cell = tableView.cellForRow(at: indexPath) {
            popoverController.sourceView = cell
            popoverController.sourceRect = cell.bounds }
        }
        
        // Add actions to the menu
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Сервис временно недоступен", message: "Извините, сервис пока не доступен, пожалуйста попробуйте позже.",
                                                 preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alertMessage.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет текста ОК
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        // Add Call action
        let callAction = UIAlertAction(title: "Позвонить " + "123-000-\(indexPath.row)" , style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //Add cancel action
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        // Check-in action
        let checkInTitle = self.restaurantIsVisited[indexPath.row] ? "Удалить из избранноого" : "Добавить в избранное"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath) as? RecipeTableViewCell
            
            
            // Solution to exercise 1
            //            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
            
            // Solution to exercise 2
            // We use the isHidden property to control whether the image view is displayed or not
            cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
            
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            //
            //        let checkInAction = if restaurantIsVisited[indexPath.row] { UIAlertAction(title: "Удалить из избранноого", style: .default, handler: {
            //            (action:UIAlertAction!) -> Void in
            //            let cell = tableView.cellForRow(at: indexPath)
            //            cell?.accessoryType = .none
            //            self.restaurantIsVisited[indexPath.row] = false
            //            })} else {
            //                UIAlertAction(title: "Добавить в избранное", style: .default, handler: {
            //                (action:UIAlertAction!) -> Void in
            //                let cell = tableView.cellForRow(at: indexPath)
            //                    cell?.accessoryType = .checkmark //UIImage(named: "heart-tick")
            //                self.restaurantIsVisited[indexPath.row] = true
        })
        
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        //Убрали индикацию выбора ячейки после того, как отобразился чекпоинт "избранное"
        tableView.deselectRow(at: indexPath, animated: false)
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true //Для корректного отображения ячеек на планшетах.
        navigationController?.navigationBar.prefersLargeTitles = true //Чтобы отображать заголовок в NavigationBar крупно. По умолчанию он стоит мелкий.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { //Добавлена нативная функция удаления ячейки. Свайп влево активирует кнопку удаления.
    //        if editingStyle == .delete {
    //            // Delete the row from the data source
    //            restaurantNames.remove(at: indexPath.row)
    //            restaurantLocations.remove(at: indexPath.row)
    //            restaurantTypes.remove(at: indexPath.row)
    //            restaurantIsVisited.remove(at: indexPath.row)
    //            restaurantImages.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)//Удаление конкретной строки с анимацией .fade
    //                //Также возможны .right , .left , and .top
    //        }
    //        print("Total items: \(restaurantNames.count)")
    //        for name in restaurantNames {//Выводм на печать наименования ресторанов и их оставшееся количество.
    //            print(name)
    //        }
    //    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")//.destructive style, indicating that the button should be in red.
        { (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.recipeNames.remove(at: indexPath.row)
            self.recipeAuthorLocations.remove(at: indexPath.row)
            self.recipeTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.recipeImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)//Удаление конкретной строки с анимацией .fade
            //Также возможны .right , .left , and .top
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Поделиться") { (action, sourceView, completionHandler) in
            let defaultText = "Рекомендую посетить: " + self.recipeNames[indexPath.row] + " " + self.recipeTypes[indexPath.row] + "\nАдрес " + self.recipeAuthorLocations[indexPath.row]
            
            let activityController: UIActivityViewController
            
            if let defaultPicture = UIImage(named: self.recipeImages[indexPath.row])
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
            
            cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
            
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            
            completionHandler(true)
        }
        checkAction.image = (checkAction.image != nil) ? UIImage(systemName: "checkmark") : UIImage(systemName: "arrow.uturn.left")
        checkAction.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0)
        //          TODO: Добваить на свайп влево действие аналогичное добавлению в избранное или удалению из него
        //    arrow.uturn.left
        //    checkmark
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkAction])
        return swipeConfiguration
        
    }
}
