//
//  RecipeDetailViewController.swift
//  FoodPin
//
//  Created by Alex on 09.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {


    @IBOutlet var recipeImageView: UIImageView!
 
    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeDescriptionLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    
    var recipeImageName = ""
    var recipeName = ""
    var recipeDescription = ""
    var ingredients = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImageView.image = UIImage(named: recipeImageName)
        recipeNameLabel.text = recipeName
        recipeDescriptionLabel.text = recipeDescription
        ingredientsLabel.text = ingredients
        
        navigationItem.largeTitleDisplayMode = .never // Для того, чтобы navigation bar title был всегда маленький и не перегружал внимание пользователя
        
    }

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
