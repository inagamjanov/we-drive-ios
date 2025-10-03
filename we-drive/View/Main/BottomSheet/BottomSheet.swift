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
    
    @EnvironmentObject private var routerMVVM: RouterMVVM
    @EnvironmentObject private var rideDetailsMVVM: RideDetailsMVVM
    
    @StateObject private var tarrifsMVVM: TarrifsMVVM = .init()
    
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
                                if newTarrif == tarrifsMVVM.selectedTarrif {
                                    tarrifsMVVM.selectedTarrif = .All
                                } else {
                                    tarrifsMVVM.selectedTarrif = newTarrif
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                
                // Tarrif Details
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(filteredTarrifs) { tarrif in
                            Button {
                                withAnimation(.easeInOut) {
                                    tarrifsMVVM.selectedTarrifCar = tarrif.id
                                    tarrifsMVVM.selectedTarrif = tarrif.tarrif
                                }
                            } label: {
                                TarrifDetailCardView(tarrif: tarrif, isSelected: tarrifsMVVM.selectedTarrifCar == tarrif.id)
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                
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
                                
                                Text("6 Daqiqa")
                                    .as_font(.callout, .regular, .gray, 1)
                            }
                        }
                        .padding(13)
                        .background(.white)
                        .cornerRadius(15)
                        
                        Image("most_fast_cars")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 90)
                            .padding(3)
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
                    Button {
                        routerMVVM.showContactPicker = true
                    } label: {
                        AdditionalDetailCardView(title: "Boshqa odam nomiga buyurtma", image: "peoples", isSelected: rideDetailsMVVM.anotherPerson != nil)
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        AdditionalDetailCardView(title: "Qo’shimcha imkoniyatlar", image: "tools", isSelected: false)
                    }
                }
                .padding(.horizontal, 15)
                
                // Details
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        if let phone = rideDetailsMVVM.anotherPerson {
                            SelectedDetailsCardView(img: "phone.fill", text: phone) {
                                rideDetailsMVVM.anotherPerson = nil
                            }
                        }
                        
                        
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 15)
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 95)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                OrderButton()
            }
        }
    }
    
    var filteredTarrifs: Array<Tarrif> {
        if tarrifsMVVM.selectedTarrif == .All {
            return tarrifsMVVM.tarrifs
        }
        
        return tarrifsMVVM.tarrifs.filter({ $0.tarrif == tarrifsMVVM.selectedTarrif })
    }
}


// MARK: - Additional Detail Card
struct AdditionalDetailCardView: View {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            LazyVStack(alignment: .leading) {
                Text(title)
                    .as_font(.callout, .medium, .black, 3, .leading, design: nil, reserve_space: true)
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
        .overlay(
            RoundedRectangle(cornerRadius: CGFloat(15))
                .stroke(isSelected ? PrimaryColor : .clear, lineWidth: 2)
        )
        .padding(1)
    }
}


// MARK: - Selected Details Card
struct SelectedDetailsCardView: View {
    
    var img: String
    var text: String
    var onClick: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                onClick()
            }
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(PrimaryColor)
                
                Text(text)
                    .as_font(.callout, .medium, .black, 1)
                
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .padding(.leading, 5)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(.white)
            .cornerRadius(10)
        }
    }
}
