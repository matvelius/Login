//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit


class User: CustomStringConvertible {
    
    let firstName: String
    let lastName: String
    let username: String
    let password: String
    let firstCar: String
    
    init(firstName: String, lastName: String, username: String, password: String, firstCar: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
        self.firstCar = firstCar
    }
    
    var description: String {
        return "\(firstName) \(lastName), username: \(username)"
    }
    
}

// dictionary for storing usernames & passwords
// -- DON'T ACTUALLY DO THIS IN PRODUCTION!
var activeUsers:[User] = []

class InputValidation {

    func validateInput(
        loggingIn: Bool,
        usernameField: UITextField,
        passwordField: UITextField,
        reEnterPasswordField: UITextField?,
        firstnameField: UITextField?,
        lastnameField: UITextField?,
        firstCarField: UITextField?) -> String? {
    
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
        
        if loggingIn {
            
            // check username & password
            for user in activeUsers {
                
                // check username
                if user.username == currentUsername {
                    
                    // check password
                    if user.password == currentPassword {
                        return nil
                    } else {
                        return "Incorrect password."
                    }
   
                }
            }
            
            // user not found
            return "Incorrect username."

        // REGISTRATION
        } else {
            
            // check if first name was entered
            guard (firstnameField != nil) && !(firstnameField?.text == "") else { return "Please enter your first name." }
            
            let currentFirstName = (firstnameField?.text)!
            
            // check if last name was entered
            guard (lastnameField != nil) && !(lastnameField?.text == "") else { return "Please enter your last name." }
            
            let currentLastName = (lastnameField?.text)!
            
            // check if password was entered 2nd time
            guard (reEnterPasswordField != nil) && !(reEnterPasswordField?.text == "") else { return "Please re-enter the password." }
            
            let currentReEnteredPassword = (reEnterPasswordField?.text)!
            
            // check if passwords don't match
            guard currentReEnteredPassword == currentPassword else {
                return "Passwords don't match!"
            }
            
            // check if security question was answered
            guard (firstCarField != nil) && !(firstCarField?.text == "") else { return "Please enter the make of your first car." }
            
            let currentFirstCar = (firstCarField?.text)!
            
            // check if username is already taken
            for user in activeUsers {
                // check username
                if user.username == currentUsername {
                    return "Username already taken, please choose another."
                }
            }
            
            // instantiate new user
            let newUser = User(firstName: currentFirstName, lastName: currentLastName, username: currentUsername, password: currentPassword, firstCar: currentFirstCar)
            
            // store new user in users array
            activeUsers.append(newUser)
            
            print(activeUsers)
            
        } // end registration
        
        // if inputs are validated, return nil (no alert message)
        return nil
        
    } // end validate input function
    
} // end class InputValidation
