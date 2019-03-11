//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameRegisterField: UITextField!
    
    @IBOutlet weak var lastNameRegisterField: UITextField!
    
    @IBOutlet weak var usernameRegisterField: UITextField!
    
    @IBOutlet weak var passwordRegisterField: UITextField!
    
    @IBOutlet weak var repeatPasswordRegisterField: UITextField!
    
    @IBOutlet weak var makeOfCar: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        // do I even need this?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        guard let sender: UIButton = sender as? UIButton else { return }
        
        // input validation
        let myValidator = InputValidation()
        
        let (title, message) = myValidator.validateInput(
            loggingIn: false,
            forgotUsername: false,
            forgotPassword: false,
            usernameField: usernameRegisterField,
            passwordField: passwordRegisterField,
            reEnterPasswordField: repeatPasswordRegisterField,
            firstnameField: firstNameRegisterField,
            lastnameField: lastNameRegisterField,
            firstCarField: makeOfCar
        )
        
        if let alertTitle: String = title, let alertMessage: String = message {
            alertUser(title: alertTitle, message: alertMessage)
        }
        
//        alertUser(title: alertTitle, message: alertMessage)
        
//        // if there's a problem during validation, alert user
//        if let alertMessage: String = message {
//            alertUser(message: alertMessage)
//        }
//
//        // if there's a problem during validation, alert user
//        if let alertTitle: String = title {
//            alertUser(message: alertMessage)
//        }
        
        guard let successfulLogin = segue.destination as? SuccessfulLoginViewController else { return }
        
        successfulLogin.receive = usernameRegisterField.text
        
        segue.destination.navigationItem.title = "You are logged in."
        
    }
    
    func alertUser(title: String, message: String) {
        let title = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
