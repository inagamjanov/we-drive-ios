//
//  TarrifCards.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Tarrifs Mini Card
struct TarrifCardView: View {
    
    // Properties
    public var tarrif: Tarrifs
    public var isSelected: Bool = false
    
    public var action: (Tarrifs) -> Void
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                action(tarrif)
            }
        } label: {
            Text(tarrif.asString)
                .as_font(.footnote, .medium, isSelected ? .white : Color.black, 1)
                .padding(.vertical, 12)
                .padding(.horizontal, 15)
                .background(isSelected ? PrimaryColor : .clear)
                .cornerRadius(CGFloat(10))
                .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(10))
                        .stroke(isSelected ? PrimaryColor : Color(.systemGray3), lineWidth: 1)
                )
                .padding(0.5)
        }
    }
}


// MARK: - Tarrif Detailed Card
struct TarrifDetailCardView: View {
    
    var tarrif: Tarrif
    var isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            
            Image(tarrif.bgImg)
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth - 40)
                .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(20))
                        .stroke(isSelected ? PrimaryColor : .white, lineWidth: 3)
                )
                .padding(1.5)
            
            LazyVStack(alignment: .leading, spacing: 7) {
                
                Text(tarrif.name)
                    .as_font(.title, .semibold, .black, 1)
                
                HStack(alignment: .center, spacing: 8) {
                    Image("person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    
                    Text("\(tarrif.capacity) Kishilik")
                        .as_font(.callout, .medium, PrimaryColor, 1)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("\(tarrif.price, specifier: "%.0f") so'm")
                        .as_font(.footnote, .medium, .gray, 1)
                    
                    Text("\(tarrif.discountedPrice, specifier: "%.0f") so'm")
                        .as_font(.body, .semibold, .black, 1)
                }
                .padding(.vertical, 5)
                
                HStack(alignment: .center, spacing: 8) {
                    Image("time")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    
                    Text("\(tarrif.time, specifier: "%.0f") Daqiqa")
                        .as_font(.footnote, .regular, .gray, 1)
                }
                
                Text("\(tarrif.cars.joined(separator: ", "))")
                    .as_font(.footnote, .regular, .gray, 1)
            }
            .padding(.horizontal, 15)
        }
    }
}
