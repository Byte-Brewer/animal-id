//
//  alamofireGet.swift
//
//
//  Created by Nazar on 07.04.17.
//
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamGet {
    
    var brakeKey = ""
    
    func getLogin() {
        let login = "kr84@animal.id"
        let password = "czAyxw4w"
        let x = "\(login):\(password)"
        print("basedec: ", x.base64Encoded()!)
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic \(x.base64Encoded()!))",
            "Accept": "application/json"
        ]
        
        Alamofire.request("http://api.animal-id.info/homeless_v1/auth/login", method: .get, headers: headers).responseJSON { response in
            // debugPrint(response)
            
            guard let jsonDict = response.result.value as? [String : Any]
                else { return }
            
            let myData = JSON(jsonDict)
            if let data = myData["data"]["auth_key"].string
            {
                // MARK: -user default
                self.brakeKey = data
                print("daaaaaata: ", data)
            }
        }
    }
    
    func getLogout() {
        print(brakeKey)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(brakeKey)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("http://api.animal-id.info/homeless_v1/auth/logout", method: .post , headers: headers).responseJSON { response in
            // debugPrint(response)
            
            guard let jsonDict = response.result.value as? [String : Any]
                else { return }
            
            let myData = JSON(jsonDict)
            if let data = myData["data"].bool
            {
                // MARK: -user default
                print("daaaaaata: ", data)
            }
        }
    }
}

extension String {
    //: ### Base64 encoding a string
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    //: ### Base64 decoding a string
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}






































