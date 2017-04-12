//
//  LoginViewController.swift
//  AnimalID
//
//  Created by Nazar on 18.03.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    let alamget = AlamGet()
    let key = UserDefaults.standard.string(forKey: "key")
    let login = "kr84@animal.id"
    let password = "czAyxw4w"
    
    @IBOutlet weak var loginTextFiel: UITextField!
    
    @IBOutlet weak var parolTextField: UITextField!
    
    @IBOutlet weak var enterButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // enterButtonOutlet.setTitleShadowColor(.blue, for: UIControlState.highlighted)
        
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        // if loginTextFiel.text == "" || parolTextField.text == "" {
        //   print("______________________")
        //      showAlert(title: "Wrong", message: "Fill All TextField Please")
        // }
        //   if loginTextFiel.text != "test@test.test" || parolTextField.text != "12345678" {
        //            getlogin()
        //            AlamGet.getLogin2()
        if alamget.getLogin(login: login, password: password) {
            
            print("++++++++++++++++++++++++")
            // showAlert(title: "Wrong", message: "Wrong Parol or Login")
        } else {
            showAlert(title: "Wrong", message: "Wrong Parol or Login")
        }
        
        /*else {
         //let vc = RegistrationViewController()
         //present(vc, animated: true, completion: nil)
         //showAlert(title: "Congratulation", message: "Conect")
         }
         */
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
//MARK: - hide keyboard
extension LoginViewController: UITextFieldDelegate {
    
    //hide keyboard when user touched ouside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //hide keyboard when press Return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
}
