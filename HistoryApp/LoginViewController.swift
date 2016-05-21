//
//  LoginViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 28/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginEmail: UITextField!
    
    @IBOutlet var loginPassword: UITextField!

    @IBOutlet var loginRegister: UIButton!

    @IBOutlet var loginAction: UIButton!
    
// Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
