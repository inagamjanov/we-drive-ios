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
    
    @State var viewport: Viewport = .camera(center: CLLocationCoordinate2D(latitude: 41.3010451, longitude: 69.3185568), zoom: 12, bearing: 0, pitch: 0)
    @State private var routeCoordinates: [CLLocationCoordinate2D] = []
    
    var body: some View {
        Map(viewport: $viewport) {
            Puck2D(bearing: .heading)
                .showsAccuracyRing(true)
                .pulsing(.init(color: UIColor(PrimaryColor), radius: .accuracy))
            
            MapViewAnnotation(coordinate: CLLocationCoordinate2D(latitude: 41.32804729179122, longitude: 69.24775661548445)) {
                Image("from")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .gridCellAnchor(.top)
            }
            .allowOverlapWithPuck(true)
            
            MapViewAnnotation(coordinate: CLLocationCoordinate2D(latitude: 41.321714138561966, longitude: 69.31162781353152)) {
                Image("to")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .gridCellAnchor(.top)
            }
            .allowOverlapWithPuck(true)
            
            if !routeCoordinates.isEmpty {
                // Route polyline
                PolylineAnnotationGroup {
                    PolylineAnnotation(id: "route-feature", lineCoordinates: routeCoordinates)
                        .lineColor("#50CD89")
                    //.lineBorderColor("#0150FF")
                    // .lineBorderWidth(2)
                        .lineWidth(6)
                }
                .layerId("route")
                .lineCap(.round)
            }
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
                viewport = .followPuck(zoom: 14.8, bearing: .course, pitch: 0)
            }
        }
        .task {
            await fetchRoute { coordinates in
                self.routeCoordinates = coordinates
            }
        }
    }
}


//MARK: -  Fetch Route between 2 Routes
func fetchRoute(onDone: @escaping ([CLLocationCoordinate2D]) -> Void) async {
    let origin = CLLocationCoordinate2D(latitude: 41.32804729179122, longitude: 69.24775661548445)
    let destination = CLLocationCoordinate2D(latitude: 41.321714138561966, longitude: 69.31162781353152)
    
    let urlString = """
                    https://api.mapbox.com/directions/v5/mapbox/driving/\(origin.longitude),\(origin.latitude);\(destination.longitude),\(destination.latitude)?geometries=geojson&access_token=\(Bundle.main.mapboxAccessToken)
                    """
    
    guard let url = URL(string: urlString) else { return }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
           let routes = json["routes"] as? [[String: Any]],
           let geometry = routes.first?["geometry"] as? [String: Any],
           let coords = geometry["coordinates"] as? [[Double]] {
            
            // Convert [lng, lat] to CLLocationCoordinate2D
            let parsed = coords.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
            
            DispatchQueue.main.async {
                onDone(parsed)
            }
        }
    } catch {
        print("Route fetch error: \(error)")
        onDone([])
    }
}
