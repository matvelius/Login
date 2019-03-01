//
//  ViewController.swift
//  Login
//
//  Created by Matvey on 2/28/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotPasswordButtonOutlet: UIButton!
    @IBOutlet weak var forgotUsernameButtonOutlet: UIButton!
    @IBOutlet weak var username: UITextField!
    
    @IBAction func forgotUsernameButton(_ sender: Any) {
        performSegue(withIdentifier: "segueFromLoginToLanding", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        performSegue(withIdentifier: "segueFromLoginToLanding", sender: forgotPasswordButton)
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
            segue.destination.navigationItem.title = username.text
        }
    
    }

}

