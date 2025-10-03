//
//  we_driveApp.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import UIKit
import SwiftUI
import CoreLocation

@main
struct we_driveApp: App {
    
    var body: some Scene {
        WindowGroup {
            RouterView(rideDetailsMVVM: RideDetailsMVVM())
                .ignoresSafeArea(.all)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .tint(PrimaryColor)
                .environmentObject(RouterMVVM())
        }
    }
}
