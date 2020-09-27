//
//  RecipeIngredientsCell.swift
//  FoodPin
//
//  Created by Alex on 24.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipeIngredientsCell: UITableViewCell {

    @IBOutlet var recipeIngredientsLabel: UILabel! {
        didSet {
            recipeIngredientsLabel.numberOfLines = 8
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
