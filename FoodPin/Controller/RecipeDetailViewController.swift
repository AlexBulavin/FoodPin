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
    @IBOutlet var recipeFaviritesIndicator: UIImageView!
    @IBOutlet var backButton: UINavigationItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RecipeDetailHeaderView!
    
    var recipe = Recipes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImageView.image = UIImage(named: recipe.recipeImages)
        recipeNameLabel.text = recipe.recipeNames
        recipeDescriptionLabel.text = recipe.recipeDescription
        ingredientsLabel.text = recipe.recipeIngredients
        recipeFaviritesIndicator.isHidden = !recipe.recipeIsLiked //isHidden противоположно по значению recipeIsLiked. То есть если isHidden = true, то имидж не должен отображаться, а если false, то должен. Но в переменной recipeIsLiked true означает Liked и имидж нужно показать, а false означает не Liked и нужно скрыть.
        
        navigationItem.largeTitleDisplayMode = .never // Для того, чтобы navigation bar title был всегда маленький и не перегружал внимание пользователя
        headerView.recipeName.text = recipe.recipeNames
        headerView.recipeImageView.image = UIImage(named: recipe.recipeImages)
        headerView.heartImageView.isHidden = !(recipe.recipeIsLiked) ? false : true
        
    }
    
    //Функция нажатия на экран (в любом месте). Подымает ActionSheet
    @IBAction func clickOnScreen(_ sender: UIButton) {
    
        let optionMenu = UIAlertController(title: nil, message: "Что Вы хотите сделать?", preferredStyle: .actionSheet) //.alert) это опциональное оформление сообщения. Алерт или actionSheet
        optionMenu.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0) //Изменить цвет текста сообщения на фирменный 90;45;128
        optionMenu.view.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет фона сообщения

        
        // Add actions to the menu
         let callActionHandler = { (action:UIAlertAction!) -> Void in
             let alertMessage = UIAlertController(title: "Сервис временно недоступен", message: "Извините, сервис пока не доступен, пожалуйста попробуйте позже.",
                                                  preferredStyle: .alert)
             alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             alertMessage.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет текста ОК
             self.present(alertMessage, animated: true, completion: nil)
         }
         
         // Add Call action
         let callAction = UIAlertAction(title: "Позвонить " + "123-000- (indexPath.row)" , style: .default, handler: callActionHandler) //вместо \(indexPath.row) нужно передать адекватный ID рецепта
         optionMenu.addAction(callAction)
        
        // Добавить/убрать в избранное
        let checkInTitle = self.recipe.recipeIsLiked ? "Удалить из избранноого" : "Добавить в избранное"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            self.recipeFaviritesIndicator.isHidden = self.recipe.recipeIsLiked
            self.recipe.recipeIsLiked = self.recipe.recipeIsLiked ? false : true
//            let parentVC = (self.navigationController?.parent)! as! RecipesTableViewController
//            parentVC.recipeIsLiked[self.indexPathRowDetail] = !self.recipeIsLiked

        })
        
        optionMenu.addAction(checkInAction)
        
        //Add Share recipe action. Делимся рецептом с друзьями.
        let shareRecipeAction = UIAlertAction(title: "Поделиться", style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            let defaultText = "Рекомендую попробовать:" + "\n" + self.recipe.recipeNames + "\n" + "Кухня: " + self.recipe.recipeType + "\n" + "Автор рецепта: " + self.recipe.recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n" + self.recipe.recipeDescription + "\n\n" + "Состав блюда:" + "\n" + self.recipe.recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https://apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
                    
                    let activityController: UIActivityViewController
                    
                    if let defaultPicture = UIImage(named: self.recipe.recipeImages)
                    { activityController = UIActivityViewController(activityItems: [ defaultText, defaultPicture], applicationActivities: nil) }
                    else
                    { activityController = UIActivityViewController(activityItems: [ defaultText], applicationActivities: nil) }
                                
                    self.present(activityController, animated: true, completion: nil)
      
        })
        optionMenu.addAction(shareRecipeAction)
        
         //Add cancel action
         let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
         
         optionMenu.addAction(cancelAction)
         
         // Display the menu
         present(optionMenu, animated: true, completion: nil)
   
    }

}
