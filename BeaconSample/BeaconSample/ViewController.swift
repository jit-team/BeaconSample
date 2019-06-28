//
//  ViewController.swift
//  BeaconSample
//
//  Created by Marek Przybolewski on 27/06/2019.
//  Copyright © 2019 Jit Team. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    let beaconRegion = CLBeaconRegion(
        proximityUUID: UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")!,
        major: 333, minor: 333, identifier: "Jit Team Region")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    locationManager.startMonitoring(for: beaconRegion)
                }
            }
        }
    }
    
    private func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        // do whatever you want when user enteres your region
    }
    
    private func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
        // do whatever you want when user leaves your region
    }
}

