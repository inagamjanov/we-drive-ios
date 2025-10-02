//
//  RouterView.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI
import CoreLocation


// MARK: - Router View
struct RouterView: View {
    
    // Properties
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        
        // Check location permission
        if [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus) {
            // Allowed
            MapView()
        } else {
            // Not Allowed
            RequestLocationPermissionView(locationManager: locationManager)
        }
    }
}
