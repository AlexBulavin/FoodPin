//
//  MapViewController.swift
//  FoodPin
//
//  Created by Alex on 04.10.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var recipe = Recipes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
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
                annotation.title = self.recipe.recipeNames + "\n" + self.recipe.recipeAuthorLocations
                annotation.subtitle = self.recipe.recipeType + "\n" + self.recipe.recipeRating
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
        

        
        UIApplication.shared.statusBarStyle = .darkContent
        

        self.navigationController!.navigationBar.tintColor = UIColor.black;
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.navigationController!.navigationBar.tintColor = UIColor.white;

        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyMarker"
    if annotation.isKind(of: MKUserLocation.self) { return nil
    }
        // Reuse the annotation if possible
    var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
    if annotationView == nil {
    annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView?.glyphText = "😋"
        annotationView?.markerTintColor = UIColor.orange
        return annotationView
    }
    
    
}
