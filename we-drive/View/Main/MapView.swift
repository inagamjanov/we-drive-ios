//
//  MapView.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI
import MapboxMaps


// MARK: - BG Map View
struct MapView: View {
    
    @State var center = CLLocationCoordinate2D(latitude: 39.5, longitude: -98.0)
    
    var body: some View {
        Map(initialViewport: .camera(center: center, zoom: 2, bearing: 0, pitch: 0))
            .ignoresSafeArea()
    }
}
