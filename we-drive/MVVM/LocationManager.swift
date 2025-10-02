//
//  LocationManager.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import os.log
import SwiftUI
import CoreLocation


// MARK: - Location Manager
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Properties
    private let locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    // Initialization
    override init() {
        super.init()
        locationManager.delegate = self
        authorizationStatus = locationManager.authorizationStatus
    }
    
    // Check status and request permission if not authorized
    func requestPermission() {
        if [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus) {
            os_log(.info, "Location access already granted")
        } else {
            if [.denied, .restricted].contains(locationManager.authorizationStatus) {
                self.openAppSettings()
            } else {
                locationManager.requestWhenInUseAuthorization()
                os_log(.info, "Requesting location access")
            }
        }
    }
    
    // Open app settings
    func openAppSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            os_log(.info, "Opening app settings")
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
    
    // Handle authorization changes
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
}
