//
//  ForgotPasswordViewController.swift
//  Login
//
//  Created by Matvey on 3/11/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var carField: UITextField!
    
    @IBAction func resetPasswordButton(_ sender: Any) {
        
        // input validation
        let myValidator = InputValidation()
        
        let (title, message) = myValidator.validateInput(
            loggingIn: false,
            forgotUsername: false,
            forgotPassword: true,
            resetPassword: false,
            usernameField: usernameField,
            passwordField: nil,
            reEnterPasswordField: nil,
            firstnameField: firstNameField,
            lastnameField: lastNameField,
            firstCarField: carField
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
                self.performSegue(withIdentifier: "resetPasswordSegue", sender: nil)
            }
            
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}
