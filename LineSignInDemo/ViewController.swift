//
//  ViewController.swift
//  LineSignInDemo
//
//  Created by Vincent Pan on 2022/2/24.
//

import UIKit
import LineSDK

class ViewController: UIViewController {

    @IBOutlet weak var lineButton: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lineButton.delegate = self

    }

    @IBAction func lineSignIn(_ sender: LoginButton) {
        LineSignInManager.shared.signIn(presentViewController: self)
    }
    
}

extension ViewController: LoginButtonDelegate {
    func loginButtonDidStartLogin(_ button: LoginButton) {
        print("Login Started")
    }
    
    func loginButton(_ button: LoginButton, didSucceedLogin loginResult: LoginResult) {
        print("Login Succeeded")
    }
    
    func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
        print("Error: \(error)")
    }
    
}
