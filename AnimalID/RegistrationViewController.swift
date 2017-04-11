//
//  RegistrationViewController.swift
//  AnimalID
//
//  Created by Nazar on 18.03.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit
import MessageUI

class RegistrationViewController: UIViewController, MFMailComposeViewControllerDelegate {
    var email = MFMailComposeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        email.mailComposeDelegate = self
        email.setToRecipients(["dipe47@icloud.com"])
        email.setSubject("[iOS] Animal-ID Регистрация")
        email.setMessageBody("Я хочу зарегистрироваться в приложении Animal-ID! \nВот мои регистрационньіе данніе: \nПочта: \nФамилия: \nТелефон: \nТелефон: \nСтрана: \nАдрес: \nПочтовий индекс:\n\n", isHTML: false)
        present(email, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}
