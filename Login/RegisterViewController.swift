//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    let userDictionary = [String: String]()
    
    @IBOutlet weak var usernameRegisterField: UITextField!
    
    @IBOutlet weak var passwordRegisterField: UITextField!
    
    @IBOutlet weak var repeatPasswordRegisterField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
//        print("hello")
//        performSegue(withIdentifier: "registerButtonSegue", sender: registerButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        guard let sender: UIButton = sender as? UIButton else { return }
        
        // input validation
        let myValidator = InputValidation()
        let message = myValidator.validateInput(loggingIn: false, usernameField: usernameRegisterField, passwordField: passwordRegisterField, reEnterPasswordField: repeatPasswordRegisterField)
        if let alertMessage: String = message {
            alertUser(message: alertMessage)
        }
        
        guard let successfulLogin = segue.destination as? SuccessfulLoginViewController else { return }
        
        successfulLogin.receive = usernameRegisterField.text
        
        segue.destination.navigationItem.title = "You are logged in."
        
    }
    
    func alertUser(message: String) {
        let title = "Error"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
