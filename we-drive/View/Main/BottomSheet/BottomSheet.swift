//
//  BottomSheet.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI


// MARK: - Bottom Draggable Sheet
struct BottomSheetView: View {
    
    @State var from: String = "IT Park"
    @State var to: String = "Impact Group"
    
    @StateObject var tarrifsMVVM: TarrifsMVVM = .init()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 15) {
                    HStack(alignment: .center, spacing: 15) {
                        Image("point")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                        
                        TextField("", text: $from, axis: .horizontal)
                            .as_font(.body, .medium, .black, 1)
                    }
                    .padding(15)
                    .background(.white)
                    .cornerRadius(15)
                    
                    HStack(alignment: .center, spacing: 15) {
                        Image("flag")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        TextField("", text: $to, axis: .horizontal)
                            .as_font(.body, .medium, .black, 1)
                        
                        Button {
                            
                        } label: {
                            Image("plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding(15)
                    .background(.white)
                    .cornerRadius(15)
                }
                .padding(.horizontal, 15)
                .padding(.top, 30)
                
                HStack(alignment: .center, spacing: 10) {
                    ForEach(Array(zip(Tarrifs.allCases.indices, Tarrifs.allCases)), id: \.0) { idx, tarrif in
                        TarrifCardView(tarrif: tarrif, isSelected: tarrifsMVVM.selectedTarrif == tarrif) { newTarrif in
                            tarrifsMVVM.selectedTarrif = newTarrif
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                OrderButton()
            }
        }
    }
}


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


// MARK: - Tarrifs Mini Card
struct TarrifCardView: View {
    
    // Properties
    public var tarrif: Tarrifs
    public var isSelected: Bool = false
    
    public var action: (Tarrifs) -> Void
    
    var body: some View {
        Button {
            withAnimation {
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
                        .stroke(isSelected ? PrimaryColor : Color.gray, lineWidth: 1)
                )
                .padding(0.5)
        }
    }
}
