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

    var recipeImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImageView.image = UIImage(named: recipeImageName)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
