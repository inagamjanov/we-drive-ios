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
    
    @State var viewport: Viewport = .camera(center: CLLocationCoordinate2D(latitude: 41.3010451, longitude: 69.3185568), zoom: 14, bearing: 0, pitch: 0)
    
    var body: some View {
        Map(viewport: $viewport) {
            Puck2D(bearing: .heading)
                .showsAccuracyRing(true)
                .pulsing(.init(color: UIColor(PrimaryColor), radius: .accuracy))
        }
        .ornamentOptions(
            OrnamentOptions(
                scaleBar: ScaleBarViewOptions(visibility: .hidden),
                compass: CompassViewOptions(visibility: .hidden)
            )
        )
        .mapStyle(.standard)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear) {
                viewport = .followPuck(zoom: 16, bearing: .course, pitch: 0)
            }
        }
    }
}
