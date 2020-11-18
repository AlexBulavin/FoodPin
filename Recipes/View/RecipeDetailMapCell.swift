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
    
    func configure(location: String) {
        // Get location
        let geoCoder = CLGeocoder()
        print("RecipeDetailMapCell control point 31", location) //Control point 31
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error { print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks { // Get the first placemark
                let placemark = placemarks[0]
                // Add annotation
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    // Set the zoom level
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
                    self.mapView.setRegion(region, animated: false) }
            }
        }) }
    
}
