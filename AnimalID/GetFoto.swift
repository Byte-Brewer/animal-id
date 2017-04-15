//
//  GetFoto.swift
//  AnimalID
//
//  Created by Nazar on 11.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetFoto {
    
    func uploadImageOne(){
        let image = UIImage(named: "pawa")
        let imageData = UIImagePNGRepresentation(image!)
        
        if imageData != nil{
            let request = NSMutableURLRequest(url: NSURL(string:"http://api.animal-id.info/homeless_v1/animal")! as URL)
            _ = URLSession.shared
            
            request.httpMethod = "POST"
            
            let boundary = NSString(format: "---------------------------14737809831466499882746641449")
            let contentType = NSString(format: "multipart/form-data; boundary=%@",boundary)
            //  println("Content Type \(contentType)")
            request.addValue(contentType as String, forHTTPHeaderField: "Content-Type")
            
            let body = NSMutableData()
            
            
            // Title
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"nickname\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("Niki".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"sex\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("1".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"animal_size\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("2".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"created_at\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("1491897163".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            // Image
            body.append(NSString(format: "\r\n--%@\r\n", boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"photo\"; filename=\"img.jpg\"\\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format: "Content-Type: application/octet-stream\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append(imageData!)
            body.append(NSString(format: "\r\n--%@\r\n", boundary).data(using: String.Encoding.utf8.rawValue)!)
            
            request.httpBody = body as Data
           
            let keyUser = UserDefaults.standard.string(forKey: "key") ?? ""  //AlamGet().keyFromDefault.string(forKey: "key") ?? ""
            let key = keyUser
            
            print("Do you have key? - ", key)
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(key)",
                "Accept": "application/json"
            ]
            
            request.allHTTPHeaderFields = headers
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")
            }
            task.resume()
            //            let returnData = NSURLConnection.sendSynchronousRequest (request as URLRequest, returning: nil)
            //
            //            let returnString = NSString(data: returnData, encoding: String.Encoding.utf8.rawValue)
            //
            //            print("returnString \(String(describing: returnString))")
            
        }
        
        
    }
    
    func uploadCoord(lat: Float, long: Float) {
        let time = NSDate()
            let request = NSMutableURLRequest(url: NSURL(string:"http://api.animal-id.info/homeless_v1/user/geo-track")! as URL)
            _ = URLSession.shared
            
            request.httpMethod = "POST"
            
            let boundary = NSString(format: "---------------------------14737809831466499882746641449")
            let contentType = NSString(format: "multipart/form-data; boundary=%@",boundary)
            //  println("Content Type \(contentType)")
            request.addValue(contentType as String, forHTTPHeaderField: "Content-Type")
            
            let body = NSMutableData()
            
            
            // Title
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"lat\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("\(lat)".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"lng\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("\(long)".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            
            body.append(NSString(format: "\r\n--%@\r\n",boundary).data(using: String.Encoding.utf8.rawValue)!)
            body.append(NSString(format:"Content-Disposition: form-data; name=\"created_at\"\r\n\r\n").data(using: String.Encoding.utf8.rawValue)!)
            body.append("\(time.timeIntervalSince1970)".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
        
            request.httpBody = body as Data
            
            let keyUser = UserDefaults.standard.string(forKey: "key") ?? ""
            let key = keyUser
            
            print("Do you have key? - ", key)
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(key)",
                "Accept": "application/json"
            ]
            
            request.allHTTPHeaderFields = headers
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    let workWithData = WorkWithCoreData()
                    workWithData.setDataCoord(lat: lat, long: long)
                    print("error=\(String(describing: error))")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")
                
              //  guard let jsonDict = response.result.value as? [String : Any]
                //    else { return }
                let myData = JSON(response as Any)
                print(myData)
                if let resp = myData["success"].bool {
                    let respon = resp
                    if respon {
                        print("TuT \(time.timeIntervalSince1970)")
                    } else {
                        let workWithData = WorkWithCoreData()
                        workWithData.setDataCoord(lat: lat, long: long)
                        print("If response False put in Core Data")
                    }
                }
            }
        
            task.resume()

        }
    
    func setCoordOnServerOrCoreData(lat: Float, long: Float) {

        uploadCoord(lat: lat, long: long)
        
    }
}

