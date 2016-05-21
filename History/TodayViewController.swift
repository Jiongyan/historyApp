//
//  TodayViewController.swift
//  History
//
//  Created by Jiongyan Zhang on 21/05/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreLocation

class TodayViewController: UIViewController, NCWidgetProviding, LocationDelegate {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    let locationManager = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        preferredContentSize = CGSizeMake(0, 60)
        
        //obtain location name
        locationManager.delegate = self
        locationManager.requestGeoPermission()
        locationManager.obtainLocation()
        
        let dataFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "h:mm a"
        timeLabel.text = dataFormatter.stringFromDate(NSDate())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    // LocationDelegate method
    func obtainedLocationWith(latitude: Double, longitude: Double) {
        
        // Put together a URL With lat and lon
        let path = "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=224300dbf5e36e99ea42e1a25c60240d&units=metric"
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
                        
                        if let weather = dict["main"] as? Dictionary<String, AnyObject>,
                            let cityName = dict["name"] as? String{
                            print("weather = \(weather)")
                            
                            dispatch_async(dispatch_get_main_queue(), { 
                                
                                self.locationLabel.text = cityName
                                
                                
                                
                            })
                            
                        }
                        
                        
                    }
                    
                    
                    
                } catch let err as NSError {
                    print("err = \(err.localizedDescription)")
                }
                
            }
            
            task.resume()
            
        }
        
        
    }
    
    
    
}
