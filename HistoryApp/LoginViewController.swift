//
//  LoginViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 28/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet var loginEmail: UITextField!
    
    @IBOutlet var loginPassword: UITextField!

    @IBOutlet var loginRegister: UIButton!

    @IBOutlet var loginAction: UIButton!
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
// Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(receiveToggleAuthUINotification), name: "ToggleAuthUINotification", object: nil)
    }
    
    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: {
            
        })
    }
    
    func receiveToggleAuthUINotification(notification: NSNotification) {
        if (notification.name == "ToggleAuthUINotification") {
            if notification.userInfo != nil {
                let userInfo:Dictionary<String,GIDGoogleUser> =
                    notification.userInfo as! Dictionary<String,GIDGoogleUser>
                
                if let user : GIDGoogleUser = userInfo["user"] {
                    
                    //FIXME: save user in userdefault
                    let tabBarController : UITabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabbarController") as! UITabBarController
                    presentViewController(tabBarController, animated: true, completion: nil)
                    
                }
                
            }
        }
    }

}
