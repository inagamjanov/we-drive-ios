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
    @EnvironmentObject private var routerMVVM: RouterMVVM
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        
        // Check location permission
        if [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus) {
            // Allowed
            MapView()
                .sheet(isPresented: .constant(true)) {
                    BottomSheetView()
                        .environmentObject(routerMVVM)
                        .presentationCornerRadius(30)
                        .interactiveDismissDisabled(true)
                        .presentationBackground(.ultraThinMaterial)
                        .presentationDragIndicator(.visible)
                        .presentationBackgroundInteraction(.enabled)
                        .presentationDetents([.height(130), .medium, .fraction(0.9)], selection: $routerMVVM.sheetSize)
                }
        } else {
            // Not Allowed
            RequestLocationPermissionView(locationManager: locationManager)
        }
    }
}
