//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

// dictionary for storing usernames & passwords -- DON'T ACTUALLY DO THIS!
var userDictionary = ["Bob": "password", "Mary": "anotherpassword"]

class InputValidation {

    func validateInput(loggingIn: Bool, usernameField: UITextField, passwordField: UITextField, reEnterPasswordField: UITextField...) -> String? {
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
        
        // store password in currentPassword variable
        guard let currentPassword = passwordField.text else {
            return "Unable to parse password"
        }
        
        // create a separate array of just the usernames currently saved
        let usernames = [String](userDictionary.keys)
        
        if loggingIn {
        
            // validate username
            guard usernames.contains(currentUsername) else {
                return "Invalid username"
            }
            
            // validate password
            guard userDictionary[currentUsername] == currentPassword else {
                return "Invalid password"
            }
        
            // registration
        } else {
            
            // check if username is already taken
            guard !usernames.contains(currentUsername) else {
                return "Username already taken, please choose another"
            }
            
            // check passwords
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
            
//            print("currentUsername: \(currentUsername)")
//            print("currentPassword: \(currentPassword)")
            
            // store new user in dictionary
            userDictionary[currentUsername] = currentPassword
            // print("User \(currentUsername) with password \(currentPassword) saved in dictionary")
//            print(userDictionary)
        }
        // if inputs are validated, return nil (no alert message)
        return nil
        
    }
    
    
    

}
