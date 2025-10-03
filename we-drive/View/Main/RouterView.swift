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
    public var rideDetailsMVVM: RideDetailsMVVM
    
    @EnvironmentObject private var routerMVVM: RouterMVVM
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        
        // Check location permission
        if [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus) {
            // Allowed
            MapView()
                .sheet(isPresented: .constant(routerMVVM.showContactPicker == false)) {
                    NavigationStack {
                        DraggableSheet()
                    }
                    .background(.ultraThinMaterial)
                    .environmentObject(routerMVVM)
                    .environmentObject(rideDetailsMVVM)
                    .presentationCornerRadius(30)
                    .interactiveDismissDisabled(true)
                    .presentationBackground(.ultraThinMaterial)
                    .presentationDragIndicator(.visible)
                    .presentationContentInteraction(.scrolls)
                    .presentationBackgroundInteraction(.enabled)
                    .presentationDetents([.height(300), .medium, .fraction(0.99)], selection: $routerMVVM.sheetSize)
                }
                .sheet(isPresented: $routerMVVM.showContactPicker) {
                    ContactPicker { number in
                        routerMVVM.showContactPicker = false
                        rideDetailsMVVM.anotherPerson = number
                    }
                    .presentationCornerRadius(30)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.large])
                }
        }
        else {
            // Not Allowed
            RequestLocationPermissionView(locationManager: locationManager)
        }
    }
}
