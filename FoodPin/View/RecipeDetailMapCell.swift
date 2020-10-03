//
//  RecipeDetailMapCell.swift
//  FoodPin
//
//  Created by Alex on 03.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import MapKit


class RecipeDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
