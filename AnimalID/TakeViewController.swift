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
    
    @IBAction func sendGeoloc(_ sender: UIButton) {
        let workWithData = WorkWithCoreData()
        let lat = Float(locationManager.location?.coordinate.latitude ?? 0.00)
        let long = Float(locationManager.location?.coordinate.longitude ?? 0.00)
        workWithData.setDataCoord(lat: lat, long: long)
        latitude.text = String(lat)
        longitude.text = String(long)
    }
    
    
    @IBAction func sendFotoButton(_ sender: UIButton) {
       // let vc = GetFoto()
       // vc.uploadImageOne()
//        print("Button")
//        let key = UserDefaults.standard
//        let titleName = key.string(forKey: "titleName")!
//        let timeStart = timeToStart()
//        showAlert(title: titleName , message: timeStart)
//        print("good")
        let workWithData = WorkWithCoreData()
        workWithData.getDataCoord()
//
    }
    func timeToStart() -> String {
       // var str: String
        let a = NSDate().timeIntervalSince1970
        print(a)
        let b = Double(UserDefaults.standard.integer(forKey: "startTime")) as TimeInterval
        print(b)
        let c = TimeInterval(b - a)
        print(c)
        let d = Date(timeIntervalSince1970: b)
        print(d)
        return String(describing: d)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }

}
