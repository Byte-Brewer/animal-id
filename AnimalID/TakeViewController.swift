//
//  TakeViewController.swift
//  AnimalID
//
//  Created by Nazar on 18.03.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit
import CoreLocation

class TakeViewController: UIViewController, CLLocationManagerDelegate, SendCountInData {
    
    let modeOfCounting = ModelOfCounting()
    let locationManager = CLLocationManager()
    var timer: Timer?
    let workWithData = WorkWithCoreData()
      
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var countCoordInCoreData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer?.invalidate()
        timerCoord()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //        let lat = locationManager.location?.coordinate.latitude ?? 0.00
        //        let long = locationManager.location?.coordinate.longitude ?? 0.00
        //        latitude.text = String(format: "%.4f", lat)
        //        timerCoord()
        workWithData.getDataAnimal()
        workWithData.delegate = self
    }
    
    @IBAction func sendGeoloc(_ sender: UIButton) {
        timer?.invalidate()
        geolocInCore()
        if modeOfCounting.isCountingActiv() {
            let toFinish = modeOfCounting.timeToFinish()
            print(toFinish, " toFinish")
            let toFinishInTime = timeToStart(timeInt: toFinish)
            showAlert(title: "До заврешеня підрахунку залишилось", message: toFinishInTime)
            print("print")
            print("Counting is active")
            timerCoord()
            
        } else {
            showAlert(title: "Підрахунок завершився, дякуємо за Вашу участь", message: "Наступний підрахунок незабаром")
            print("Poker")
            print("Counting is end or not start")
        }
        
        // let getFoto = GetFoto()
        // getFoto.uploadCoord(lat: lat, long: long)
    }
    
    func geolocInCore() {
        
        if modeOfCounting.isCountingActiv() {
            let lat = Float(locationManager.location?.coordinate.latitude ?? 0.00)
            let long = Float(locationManager.location?.coordinate.longitude ?? 0.00)
            // let workWithData = WorkWithCoreData()
            let getFoto = GetFoto()
            getFoto.setCoordOnServerOrCoreData(lat: lat, long: long)
            
            // workWithData.setDataCoord(lat: lat, long: long)
            latitude.text = String(lat)
            longitude.text = String(long)
            //let getFoto = GetFoto()
            //getFoto.uploadCoord(lat: lat, long: long)
            print("                                                           geolocInCore")
        } else {
            showAlert(title: "Підрахунок завершився, дякуємо за Вашу участь", message: "Наступний підрахунок незабаром")
            timer?.invalidate()
        }
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
        
        // let workWithData = WorkWithCoreData()
        workWithData.getDataCoord()
        timer?.invalidate()
    }
    func timeToStart(timeInt: TimeInterval) -> String {
        var str = ""
        var day = 0
        var hour = 0
        var minut = 0
        var temp = -timeInt
        while temp - 86400 > 0 {
            day += 1
            temp -= 86400
        }
        while temp - 3600 > 0 {
            hour += 1
            temp -= 3600
        }
        while temp - 60 > 0 {
            minut += 1
            temp -= 60
        }
        if day > 0 {
            str += "\(String(day)) : days "
        }
        str += "\(String(hour)) : hours "
        str += "\(String(minut)) : minuts"
        return str
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    func timerCoord() {
        timer = Timer.scheduledTimer(timeInterval: 3.2,
                                     target: self,
                                     selector: #selector(self.geolocInCore),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func setLabel(text: Int?) {
        if text != nil {
        countCoordInCoreData.text = String(describing: text!)
        } else {
            countCoordInCoreData.text = "I don't know! "
        }
    }
}
