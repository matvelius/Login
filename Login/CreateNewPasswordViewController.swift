//
//  CreateNewPasswordViewController.swift
//  Login
//
//  Created by Matvey on 3/11/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var newPasswordField: UITextField!
    
    @IBOutlet weak var repeatPasswordField: UITextField!

    @IBAction func resetPassword(_ sender: Any) {
        
        // input validation
        let myValidator = InputValidation()
        
        let (title, message) = myValidator.validateInput(
            loggingIn: false,
            forgotUsername: false,
            forgotPassword: false,
            resetPassword: true,
            usernameField: usernameField,
            passwordField: newPasswordField,
            reEnterPasswordField: repeatPasswordField,
            firstnameField: nil,
            lastnameField: nil,
            firstCarField: nil
        )
        
        if let alertTitle: String = title, let alertMessage: String = message {
            alertUser(title: alertTitle, message: alertMessage)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func alertUser(title: String, message: String) {
        
        let title = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in if title == "Success" {
                self.performSegue(withIdentifier: "backToLoginFromReset", sender: nil)
            }
            
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}
