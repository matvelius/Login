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
    
    let userDictionary = ["Bob": "password", "Mary": "anotherpassword"]
    
    
    
    @IBAction func forgotUsernameButton(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: forgotUsernameButtonOutlet)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: forgotPasswordButtonOutlet)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender: UIButton = sender as? UIButton else { return }
        
        if sender == forgotPasswordButtonOutlet {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButtonOutlet {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            checkForEmptyFields()
            
            // store username in currentUsername variable
            guard let currentUsername = usernameField.text else {
                alertUser(message: "Unable to parse username")
                return
            }
            
            // store username in currentUsername variable
            guard let currentPassword = passwordField.text else {
                alertUser(message: "Unable to parse password")
                return
            }
            
            // validate username
            let usernames = [String](userDictionary.keys)
            guard usernames.contains(currentUsername) else {
                alertUser(message: "Invalid username")
                return
            }
            
            // validate password
            guard userDictionary[currentUsername] == currentPassword else {
                alertUser(message: "Invalid password")
                return
            }
            
            
            
            guard let successfulLogin = segue.destination as? SuccessfulLoginViewController else { return }
            
            successfulLogin.receive = usernameField.text
            

            
            segue.destination.navigationItem.title = "You are logged in."
            
        }
    }
    
    func checkForEmptyFields() {
        // check if username was entered
        guard !(usernameField.text == "") else {
            alertUser(message: "Please enter your username")
            return
        }
        
        // check if password was entered
        guard !(passwordField.text == "") else {
            alertUser(message: "Please enter your password")
            return
        }
    }
    
    func alertUser(message: String) {
        let title = "Error"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

