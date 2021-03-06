//
//  ViewController.swift
//  Login
//
//  Created by Matvey on 2/28/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var forgotPasswordButtonOutlet: UIButton!
    @IBOutlet weak var forgotUsernameButtonOutlet: UIButton!
   
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func forgotUsernameButton(_ sender: Any) {
//        performSegue(withIdentifier: "mySegue", sender: forgotUsernameButtonOutlet)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
//        performSegue(withIdentifier: "mySegue", sender: forgotPasswordButtonOutlet)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender: UIButton = sender as? UIButton else { return }
        
        if sender == forgotPasswordButtonOutlet {

            segue.destination.navigationItem.title = "Forgot Password"

        } else if sender == forgotUsernameButtonOutlet {

            segue.destination.navigationItem.title = "Forgot Username"

        } else {
        
            // input validation
            let myValidator = InputValidation()

            let (title, message) = myValidator.validateInput(
                loggingIn: true,
                forgotUsername: false,
                forgotPassword: false,
                resetPassword: false,
                usernameField: usernameField,
                passwordField: passwordField,
                reEnterPasswordField: nil,
                firstnameField: nil,
                lastnameField: nil,
                firstCarField: nil)
            
            if let alertTitle: String = title, let alertMessage: String = message {
                alertUser(title: alertTitle, message: alertMessage)
            }
            
            guard let successfulLogin = segue.destination as? SuccessfulLoginViewController else { return }
            
            successfulLogin.receive = usernameField.text
            
            segue.destination.navigationItem.title = "You are logged in."
            
        }
    }
    
    func alertUser(title: String, message: String) {
        let title = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

