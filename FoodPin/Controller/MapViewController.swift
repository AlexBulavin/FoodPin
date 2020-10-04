//
//  MapViewController.swift
//  FoodPin
//
//  Created by Alex on 04.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var recipe = Recipes()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
       
        geoCoder.geocodeAddressString(recipe.recipeAuthorLocations, completionHandler: { placemarks, error in
        if let error = error { print(error)
        return
        }
                                        
        if let placemarks = placemarks {
            // Get the first placemark
            let placemark = placemarks[0]
        
        // Add annotation
        let annotation = MKPointAnnotation()
        annotation.title = self.recipe.recipeNames
        annotation.subtitle = self.recipe.recipeType
        if let location = placemark.location {
            annotation.coordinate = location.coordinate
            // Display the annotation
        self.mapView.showAnnotations([annotation], animated: true)
        self.mapView.selectAnnotation(annotation, animated: true)
            
            }
        
        }
})
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.hidesBarsOnSwipe = true
        
        UIApplication.shared.statusBarStyle = .darkContent
    }
}
