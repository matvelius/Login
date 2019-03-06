//
//  FirstScreen.swift
//  Login
//
//  Created by Matvey on 3/5/19.
//  Copyright © 2019 Matvey. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBAction func loginButtonFirstScreen (_ sender: Any) {
    }
    
    @IBAction func signupButtonFirstScreen (_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        logo.layer.cornerRadius = 10
//        logo.clipsToBounds = true
//        logo.layer.borderWidth = 3
//        logo.layer.borderColor = UIColor.white.cgColor
    }
    
    // set stack to vertical or horizontal axis, depending on the orientation!
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) -> Void in
            
            let orientation = UIApplication.shared.statusBarOrientation
            
            if orientation.isLandscape {
                self.stackView.axis = .horizontal
                print("horizontal")
            } else {
                self.stackView.axis = .vertical
                print("vertical")
            }
            
        }, completion: nil)
    }
}
