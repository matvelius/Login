//
//  File.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let userDictionary = [String: String]()
    
    @IBOutlet weak var usernameRegisterField: UITextField!
    
    @IBOutlet weak var passwordRegisterField: UITextField!
    
    @IBOutlet weak var repeatPasswordRegisterField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        print("hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
