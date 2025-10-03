//
//  MapOverView.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI
import MapboxMaps


// MARK: - Map Over View
struct MapOverlay: View {
    
    @Binding var viewport: Viewport
    @EnvironmentObject private var routerMVVM: RouterMVVM
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Spacer()
            
            Button {
                withAnimation {
                    viewport = .followPuck(zoom: 14, bearing: .course, pitch: 0)
                }
            } label: {
                Image("target")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(8)
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.04), radius: 1, x: 1, y: 3)
            }
        }
        .padding(.bottom, routerMVVM.sheetSize == .height(300) ? 350 : (screenHeight / 2 + 50))
        .animation(.easeOut, value: routerMVVM.sheetSize)
    }
}
