//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class InputValidation {
    
    let userDictionary = ["Bob": "password", "Mary": "anotherpassword"]

    func checkForEmptyFields(usernameField: UITextField, passwordField: UITextField, reEnterPasswordField: UITextField...) -> String? {
        // check if username was entered
        guard !(usernameField.text == "") else {
            return "Please enter your username"
        }
        
        // check if password was entered
        guard !(passwordField.text == "") else {
            return "Please enter your password"
        }
        
        // store username in currentUsername variable
        guard let currentUsername = usernameField.text else {
            return "Unable to parse username"
        }
        
        // store username in currentUsername variable
        guard let currentPassword = passwordField.text else {
            return "Unable to parse password"
        }
        
        // validate username
        let usernames = [String](userDictionary.keys)
        guard usernames.contains(currentUsername) else {
            return "Invalid username"
        }
        
        // validate password
        guard userDictionary[currentUsername] == currentPassword else {
            return "Invalid password"
            
        }
        
        for extraField in reEnterPasswordField {
            
            // check if password was re-entered
            guard !(extraField.text == "") else {
                return "Please re-enter the password"
            }
            
            // check if passwords match
            guard extraField.text == passwordField.text else {
                return "Passwords don't match!"
            }
            
        }
        
        // if inputs are validated, return nil
        return nil
        
    }
    
    
    

}
