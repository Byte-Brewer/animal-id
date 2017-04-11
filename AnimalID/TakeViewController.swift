//
//  TakeViewController.swift
//  AnimalID
//
//  Created by Nazar on 18.03.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit
import CoreLocation

class TakeViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let lat = locationManager.location?.coordinate.latitude ?? 0.00
        let long = locationManager.location?.coordinate.longitude ?? 0.00
        
        latitude.text = String(format: "%.4f", lat)
        longitude.text = String(format: "%.4f", long)
        
        // Do any additional setup after loading the view.
    }
}
