//
//  DetailViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 30/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName : String?
    var descriptionText : String?
    var wikiUrl : String?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName!)
        descriptionDetail.text = descriptionText
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        descriptionDetail.scrollEnabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        descriptionDetail.scrollEnabled = true
    }
    

    @IBAction func dismissCurrentPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func showWiKiPage(sender: AnyObject) {
        let wikiURL = NSURL(string: wikiUrl!)
        if UIApplication.sharedApplication().canOpenURL(wikiURL!) {
            UIApplication.sharedApplication().openURL(wikiURL!)
        } else {
            print("Can't open url.")
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
