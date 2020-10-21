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
    @IBOutlet var rateButtons: [UIButton]!
    
    var recipe = Recipes ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: recipe.recipeImages)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 300, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5, y: 5)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        
        for rateButton in rateButtons{ //делаем кнопки рейтинга невидимыми
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
            for rateButton in self.rateButtons{
                rateButton.alpha = 1.0; rateButton.transform = .identity
            }

        }, completion: nil)
    }

}
