//
//  SigninViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 14.06.2023.
//

import UIKit

class SigninViewController: UIViewController {
    @IBOutlet weak var signinInfoLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signinButton: Button!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func forgotPasswordTouched(_ sender: Any) {
        
    }
        
    @IBAction func signinButtonTouched(_ sender: Any) {
        
    }
    
    @IBAction func signupButtonTouched(_ sender: Any) {
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        show(signupVC, sender: self)
    }
}
