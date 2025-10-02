//
//  OrderButton.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Bottom Order Button
struct OrderButton: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Button {
                // TODO: - Change Payment Type
                print("First")
            } label: {
                HStack(alignment: .center, spacing: 10) {
                    Image("cash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Naqd pulda")
                        .as_font(.body, .medium, .black)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.right")
                        .as_font(.caption, .semibold, .gray)
                }
                .frame(width: screenWidth - 35)
                .padding(.top, 20)
            }
            
            Button {
                // TODO: - Order a Taxi
                print("Second")
            } label: {
                Text("Buyurtma berish")
                    .frame(width: screenWidth - 60)
                    .as_font(.headline, .semibold, .white, 1)
                    .padding(15)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: "#0150FF"), Color(hex: "#4DC9E6")]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .padding(.bottom, 75)
            }
        }
        .frame(width: screenWidth)
        .background(.white)
        .clipShape(RoundedShape())
    }
}
