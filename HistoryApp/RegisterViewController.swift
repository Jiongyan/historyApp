//
//  RegisterViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 10/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, LocationDelegate {

    let locationManager = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //obtain location name
        locationManager.delegate = self
        locationManager.requestGeoPermission()
        locationManager.obtainLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissRegisterPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // LocationDelegate method
    func obtainedLocationWith(latitude: Double, longitude: Double) {
        
        // Put together a URL With lat and lon
        let path = "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=224300dbf5e36e99ea42e1a25c60240d"
        print(path)
        
        let url = NSURL(string: path)
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        dispatch_async(queue) {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
                
                do {
                    
                    guard let responseData = data else {
                        //FIXME: alert user can't get data from weather api
                        return
                    }
                    
                    if let dict = try NSJSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments) as? Dictionary<String, AnyObject> {
                        print("dict = \(dict)")
                        
                        if let weather = dict["main"] as? Dictionary<String, AnyObject> {
                            print("weather = \(weather)")
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                } catch let err as NSError {
                    print("err = \(err.localizedDescription)")
                }
                
            }
            
            task.resume()
            
        }
        
        
//        locationManager.obtainLocationName(latitude, lon: longitude) { (success, locationName) in
//            if success {
//                if let name = locationName {
//                    print("name = \(name)")
//                }
//            }
//        }
    }



}
