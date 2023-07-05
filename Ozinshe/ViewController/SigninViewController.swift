//
//  SigninViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 14.06.2023.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

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
    
    @IBAction func showPasswordButtonTouched(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    
    @IBAction func forgotPasswordTouched(_ sender: Any) {
        
    }
        
    @IBAction func signinButtonTouched(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let parameters = ["email": email, "password": password]
        
        AF.request(Urls.SIGN_IN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
            var resultString = ""
            if let data = response.data{
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if let token = json["accessToken"].string {
                    Storage.sharedInstance.accessToken = token
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    self.startApp()
                } else {
                    SVProgressHUD.showError(withStatus: "CONNECTION_ERROR")
                }
            } else {
                var ErrorString = "CONNECTION_ERROR"
                if let sCode = response.response?.statusCode {
                    ErrorString += " \(sCode)"
                }
                ErrorString += " \(resultString)"
                SVProgressHUD.showError(withStatus: "\(ErrorString)")
            }
        }
    }
    
    func startApp() {
        let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController")
        tabViewController?.modalPresentationStyle = .fullScreen
        self.present(tabViewController!, animated: true)
    }
    
    @IBAction func signupButtonTouched(_ sender: Any) {
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        show(signupVC, sender: self)
    }
}
