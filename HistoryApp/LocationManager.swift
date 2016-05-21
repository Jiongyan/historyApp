//
//  LocationManager.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 19/05/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationDelegate {
    
    func obtainedLocationWith(latitude: Double,longitude: Double)
}

public class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let manager : CLLocationManager = CLLocationManager()
    var bestLocation: CLLocation?
    var delegate: LocationDelegate?
    
    public func requestGeoPermission() {
        let status = CLLocationManager.authorizationStatus()
        
        if (status == CLAuthorizationStatus.NotDetermined) {
            manager.requestWhenInUseAuthorization()
        }
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    public func obtainLocation() {
        
        manager.startUpdatingLocation()
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        print("location manager failed with error\(error.description)")
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("locations = \(locations)")
        
        for location: CLLocation in locations {
            
            if let best = bestLocation {
                
                if location.horizontalAccuracy < best.horizontalAccuracy {
                    bestLocation = location
                }
                else {
                    manager.stopUpdatingLocation()
                    if let delegateMethod = self.delegate {
                        delegateMethod.obtainedLocationWith(location.coordinate.latitude,longitude: location.coordinate.longitude)
                    }
                    break
                }
            }
            else {
                
                bestLocation = CLLocation()
                bestLocation = location
            }
            
        }
    }
    
    public func obtainLocationName(lat: Double, lon: Double, completion:(success: Bool, locationName: String?) -> Void) {
        
        let latitude : CLLocationDegrees = CLLocationDegrees(lat)
        let longitude : CLLocationDegrees = CLLocationDegrees(lon)
        let location : CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            
            if let err = error {
                print("reverse geocode fail: \(err.localizedDescription)")
                completion(success: false,locationName: nil)
            }
            else {
                if let marks = placemarks {
                    
                    let placemark : CLPlacemark = marks[0]
                    //print("placemark: \(placemark)")
                    
                    if let subLocality = placemark.subLocality {
                        completion(success: true,locationName: subLocality)
                    }
                    else if let locality = placemark.locality {
                        completion(success: true,locationName: locality)
                    }
                    else if let admArea = placemark.administrativeArea {
                        completion(success: true,locationName: admArea)
                    }
                    else if let country = placemark.country {
                        completion(success: true,locationName: country)
                    }
                    else {
                        completion(success: false,locationName: nil)
                    }
                }
                else {
                    completion(success: false,locationName: nil)
                }
            }
            
            
        }
    }
    
}