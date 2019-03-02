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
    
    var receive: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        successLabel.text = "You're not logged in."
        
        guard let receivedUsername = receive else {
            print("did not receive a username from login screen")
            return
        }
        
        successLabel.text = "Welcome, \(receivedUsername)!"
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
