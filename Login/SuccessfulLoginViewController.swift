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
        
//        "You've logged in # times so far."
        
//        successLabel.text = "Welcome, \(receivedUsername)!"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
