//
//  RecipeDetailHeaderView.swift
//  FoodPin
//
//  Created by Alex on 24.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipeDetailHeaderView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var recipeName: UILabel! {
        didSet {
            recipeName.numberOfLines = 0
        }
    }
    @IBOutlet var heartImageView: UIImageView! {
        didSet {
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
    }
    
}
