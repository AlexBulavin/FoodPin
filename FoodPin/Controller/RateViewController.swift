//
//  RateViewController.swift
//  FoodPin
//
//  Created by Alex on 20.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var reteButtons: [UIButton]!
    
    var recipe = Recipes ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: recipe.recipeImages)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
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
