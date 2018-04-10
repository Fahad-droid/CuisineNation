//
//  LocationViewController.swift
//  CuisineNation
//
//  Created by Fahad Shaikh on 2017-04-10.
//  Copyright © 2017 Fahad Shaikh. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var mapObj: MKMapView!
    //@IBOutlet weak var ountryName: UITextField!
    @IBOutlet weak var countryName: UITextField!
    var mapManager = CLLocationManager()
    var border : [Border] = []
    var annotations : [MKPointAnnotation] = []
    var delegate : GuardViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        countryName.delegate = self
        mapManager.delegate = self                            // ViewController is the "owner" of the map.
        mapManager.desiredAccuracy = kCLLocationAccuracyBest  // Define the best location possible to be used in app.
        mapManager.requestWhenInUseAuthorization()            // The feature will not run in background
        mapManager.startUpdatingLocation()                    // Continuously geo-position update
        mapObj.delegate = self
        
        
        loadData()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func findBorder(_ sender: UIButton) {
        mapObj.removeAnnotations(annotations)
        countryName.resignFirstResponder()
        if let b1 = retrieveData(countryName: countryName.text!) {
            let userAnnotation = MKPointAnnotation()
            userAnnotation.coordinate = CLLocationCoordinate2DMake(b1.country.latitude, b1.country.longitude)
            mapObj.addAnnotation(userAnnotation)
            annotations.append(userAnnotation)
            
            
            // Here we define the map's zoom. The value 0.01 is a pattern
            let zoom:MKCoordinateSpan = MKCoordinateSpanMake(100, 100)
            
            // Store latitude and longitude received from smartphone
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(b1.country.latitude, b1.country.longitude)
            
            // Based on myLocation and zoom define the region to be shown on the screen
            let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, zoom)
            
            // Setting the map itself based previous set-up
            mapObj.setRegion(region, animated: true)
            
            
            for c in b1.countryborder {
                let countryBorderAnnotation = MKPointAnnotation()
                countryBorderAnnotation.coordinate = CLLocationCoordinate2DMake(c.latitude, c.longitude)
                mapObj.addAnnotation(countryBorderAnnotation)
                annotations.append(countryBorderAnnotation)
            }
        }
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    
    // dismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func loadData(){
        let it = Country(name: "Italy", capital: "Rome", latitude: 41.8719, longitude: 12.5674)
        let ca = Country(name: "Canada", capital: "Ottawa", latitude: 50.1453591, longitude: -157.6503695)
        let id = Country(name: "India", capital: "Delhi", latitude: 20.5937, longitude: 78.9629)
        let jp = Country(name: "Japan", capital: "Tokyo", latitude: 36.2048, longitude: 138.2529)
        
        
        let b1 = Border(country: it)
        
        
        let b2 = Border(country: ca)
        
        
        let b3 = Border(country: id)
        
        
        let b4 = Border(country: jp)
        
        
        
        border.append(b1)
        border.append(b2)
        border.append(b3)
        border.append(b4)
        
    }
    
    func retrieveData(countryName : String) -> Border? {
        for b in border {
            if b.country.countryName == countryName {
                return b
            }
        }
        return nil
    }
    
}

