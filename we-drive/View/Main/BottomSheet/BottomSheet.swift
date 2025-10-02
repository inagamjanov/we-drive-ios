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
                // Direction
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
                
                // Tarrifs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(Array(zip(Tarrifs.allCases.indices, Tarrifs.allCases)), id: \.0) { idx, tarrif in
                            TarrifCardView(tarrif: tarrif, isSelected: tarrifsMVVM.selectedTarrif == tarrif) { newTarrif in
                                tarrifsMVVM.selectedTarrif = newTarrif
                            }
                        }
                    }
                    .padding(.leading, 15)
                }
                
                // Tarrif Details
                
                // Most Faster
                Button {
                    
                } label: {
                    ZStack(alignment: .trailing) {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .center, spacing: 10) {
                                Image("green_spark_fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Eng tez")
                                    .as_font(.callout, .semibold, .black, 1)
                            }
                            
                            Text("Minimal narx: 32 000 so'm")
                                .as_font(.callout, .medium, .black, 1)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image("time")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("6 minut")
                                    .as_font(.callout, .regular, .gray, 1)
                            }
                        }
                        .padding(13)
                        .background(.white)
                        .cornerRadius(15)
                        
                        Image("most_fast_cars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(5)
                    }
                }
                .padding(.horizontal, 15)
                
                // Review
                Button {
                    
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Image("message")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                        
                        Text("Xaydovchiga izoh yozish")
                            .as_font(.body, .medium, .black)
                        
                        Spacer()
                    }
                    .padding(15)
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                }
                
                // Additional Detail
                HStack(alignment: .center, spacing: 10) {
                    NavigationLink {
                        
                    } label: {
                        AdditionalDetailCardView(title: "Boshqa odam nomiga buyurtma", image: "peoples")
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        AdditionalDetailCardView(title: "Qo’shimcha imkoniyatlar", image: "tools")
                    }
                }
                .padding(.horizontal, 15)
            }
            .padding(.vertical, 30)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                OrderButton()
            }
        }
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
                        .stroke(isSelected ? PrimaryColor : Color(.systemGray3), lineWidth: 1)
                )
                .padding(0.5)
        }
    }
}


// MARK: - Additional Detail Card
struct AdditionalDetailCardView: View {
    
    var title: String
    var image: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            LazyVStack(alignment: .leading) {
                Text(title)
                    .as_font(.callout, .regular, .black, 3, .leading, design: nil, reserve_space: true)
            }
            .padding(.bottom, 30)
            .padding(13)
            .background(.white)
            .cornerRadius(15)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(3)
        }
    }
}
