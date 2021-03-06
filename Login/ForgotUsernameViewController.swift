//
//  ForgotUsernameViewController.swift
//  Login
//
//  Created by Matvey on 3/10/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ForgotUsernameViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var carField: UITextField!
        
    @IBAction func retrieveUsernameButton(_ sender: Any) {

        // input validation
        let myValidator = InputValidation()
        
        let (title, message) = myValidator.validateInput(
            loggingIn: false,
            forgotUsername: true,
            forgotPassword: false,
            resetPassword: false,
            usernameField: nil,
            passwordField: passwordField,
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
                self.performSegue(withIdentifier: "backToLogin", sender: nil)
            }
            
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}
