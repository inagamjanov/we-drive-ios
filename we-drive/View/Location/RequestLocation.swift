//
//  RequestLocation.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI


// MARK: - Request Location Permission View
struct RequestLocationPermissionView: View {
    
    // Properties
    var locationManager: LocationManager
    
    var body: some View {
        LazyVStack(spacing: 20) {
            LottieView(filename: "location", loopMode: .loop, animationSpeed: 0.8)
                .frame(width: 300, height: 200)
            
            Text("Allow Location")
                .as_font(.body, .semibold, .black, Int.max, .center)
                .padding(.horizontal, 20)
            
            Button {
                withAnimation {
                    locationManager.requestPermission()
                }
            } label: {
                LazyVStack {
                    Text("Allow")
                        .as_font(.headline, .semibold, .white, 1)
                }
                .padding(15)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#0150FF"), Color(hex: "#4DC9E6")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(15)
            }
        }
        .padding(30)
        .frame(width: screenWidth, height: screenHeight, alignment: .center)
        .background(.ultraThinMaterial)
    }
}
