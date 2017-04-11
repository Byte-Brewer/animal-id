//
//  LoginViewController.swift
//  AnimalID
//
//  Created by Nazar on 18.03.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire

class LoginViewController: UIViewController, MFMailComposeViewControllerDelegate {
    var email = MFMailComposeViewController()
    let alamget = AlamGet()
    
    @IBOutlet weak var loginTextFiel: UITextField!
    
    @IBOutlet weak var parolTextField: UITextField!
    
    @IBOutlet weak var enterButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamget.getLogin()
        enterButtonOutlet.setTitleShadowColor(.blue, for: UIControlState.highlighted)
        
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        if loginTextFiel.text == "" || parolTextField.text == "" {
            print("______________________")
            alamget.getLogout()
            showAlert(title: "Wrong", message: "Fill All TextField Please")
        }
        if loginTextFiel.text != "test@test.test" || parolTextField.text != "12345678" {
//            getlogin()
//            AlamGet.getLogin2()
            
            print("++++++++++++++++++++++++")
            showAlert(title: "Wrong", message: "Wrong Parol or Login")
        } /*else {
            //let vc = RegistrationViewController()
            //present(vc, animated: true, completion: nil)
            //showAlert(title: "Congratulation", message: "Conect")
        }
        */
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //let secondActio = UIAlertAction(title: "Second", style: UIAlertActionStyle.destructive, handler: nil)
        alertController.addAction(defaultAction)
        //alertController.addAction(secondActio)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    func newMessage() {
        email.mailComposeDelegate = self
        email.setToRecipients(["dipe47@icloud.com","animal.id.info@gmail.com"])
        email.setSubject("[iOS] Animal-ID Регистрация")
        email.setMessageBody("Я хочу зарегистрироваться в приложении Animal-ID! \nВот мои регистрационньіе данніе: \nПочта: \nФамилия: \nТелефон: \nТелефон: \nСтрана: \nАдрес: \nПочтовий индекс:\n\n", isHTML: false)
        present(email, animated: true, completion: nil)
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
    func loginFunc() {
        
        let str = "http://api.animal-id.info/homeless_v1/auth/login"
       // let str = "http://api.openweathermap.org/data/2.5/forecast/city?id=" + codCity + "&APPID=191d74d86498d5dad2471e31ecb8e013"
        // let str = "http://avionicus.com/android/track_v0652.php?avkey=1M1TE9oeWTDK6gFME9JYWXqpAGc%3D&hash=58ecdea2a91f32aa4c9a1d2ea010adcf2348166a04&track_id=36131&user_id=22"
        let url = URL(string: str)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        // Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        print("Thi is my object")
    }
    
}
