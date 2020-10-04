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
        print("Print from MapViewController value of recipe.recipeAuthorLocations", recipe.recipeAuthorLocations)
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
    /*
 func configure(location: String) {
     // Get location
 let geoCoder = CLGeocoder()
     print(location)
 geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
 if let error = error { print(error.localizedDescription)
     return
 }
 if let placemarks = placemarks { // Get the first placemark
     let placemark = placemarks[0]
             // Add annotation
 let annotation = MKPointAnnotation()
 if let location = placemark.location {
 // Display the annotation annotation.coordinate = location.coordinate
     self.mapView.addAnnotation(annotation)
                 // Set the zoom level
 let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
 self.mapView.setRegion(region, animated: false) }
 }
 }) }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   

}
