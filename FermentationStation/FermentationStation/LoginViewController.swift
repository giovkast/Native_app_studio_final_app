//
//  LoginViewController.swift
//  FermentationStation
//
//  Created by Giovanni Kastanja on 19/10/2017.
//  Copyright © 2017 Giovanni Kastanja. All rights reserved.
//
// according to: https://www.youtube.com/watch?v=asKXHVUZiIY

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginSegmentedControl: UISegmentedControl!
    @IBOutlet weak var signInRegisterLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignin: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // for signing in the user if the selector is on sign-in
    // or for registering the user if the selector is on register
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        if isSignin {
            // use firebase to signIn user
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "signInSegue", sender: self)
                } else {
                    self.signInRegisterLabel.text = "user not known"
                }
            }
        } else {
            // use firebase to register user
            Auth.auth().createUser(withEmail: email, password:password) { (user,error) in
                self.performSegue(withIdentifier: "signInSegue", sender: self)
            }
        }
    }
    
    // for chaning the selector, and the behavior of th
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        isSignin = !isSignin
        
        if isSignin {
            signInRegisterLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        } else {
            signInRegisterLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }

}
