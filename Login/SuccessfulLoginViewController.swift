//
//  SuccessfulLoginViewController.swift
//  Login
//
//  Created by Matvey on 3/2/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class SuccessfulLoginViewController: UIViewController {
    @IBOutlet weak var successLabel: UILabel!
    
    @IBOutlet weak var loggedInTimesLabel: UILabel!
    
    var receive: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        successLabel.text = "You're not logged in."
        
        guard let receivedUsername = receive else {
            print("Could not retrieve the username.")
            return
        }
        
        // check username & set password
        for user in activeUsers {
            if user.username == receivedUsername {
                user.loginCounter += 1
                successLabel.text = "Welcome, \(user.firstName) \(user.lastName)!"
                loggedInTimesLabel.text = "You've logged in \(user.loginCounter) time(s) so far."
            }
        }
        
    }
    
}
