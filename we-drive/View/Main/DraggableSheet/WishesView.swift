//
//  WishesView.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Wishes View
struct WishesView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var rideDetailsMVVM: RideDetailsMVVM
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach([Wishes.ChildSeat, Wishes.NoSmoking], id: \.self) { wish in
                    WishCardView(wish: wish, isSelected: rideDetailsMVVM.wishes.contains(wish)) {
                        if rideDetailsMVVM.wishes.contains(wish) {
                            rideDetailsMVVM.wishes.remove(wish)
                        } else {
                            rideDetailsMVVM.wishes.insert(wish)
                        }
                    }
                }
                
                HStack(alignment: .center, spacing: 7) {
                    Image(systemName: "heart.fill")
                        .as_font(.headline, .medium, Color(.systemRed))
                    
                    Text("Istaklarim")
                        .as_font(.headline, .semibold, .black)
                }
                .padding(.top, 20)
                
                ForEach([Wishes.DontCall, Wishes.Assistance, Wishes.PetTransport, Wishes.CantSpeak], id: \.self) { wish in
                    WishCardView(wish: wish, isSelected: rideDetailsMVVM.wishes.contains(wish)) {
                        if rideDetailsMVVM.wishes.contains(wish) {
                            rideDetailsMVVM.wishes.remove(wish)
                        } else {
                            rideDetailsMVVM.wishes.insert(wish)
                        }
                    }
                }
                
                Button {
                    dismiss()
                } label: {
                    LazyVStack {
                        Text("Saqlash")
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
                .padding(.vertical, 20)
            }
            .padding(20)
        }
        .navigationTitle("Qo'shimcha talablar")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: - Wish Card
struct WishCardView: View {
    
    var wish: Wishes
    var isSelected: Bool
    var onCLick: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if let image = wish.asWish.image {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(wish.asWish.title)
                    .as_font(.body, .medium, .black, 1)
                
                if let caption = wish.asWish.caption {
                    Text(caption)
                        .as_font(.caption, .regular, .gray, 1)
                }
            }
            
            Spacer(minLength: 0)
            
            if wish.asWish.toggleType == .Toggle {
                Toggle("", isOn: Binding(get: { isSelected }, set: { _ in onCLick() }))
                    .toggleStyle(SwitchToggleStyle())
                    .labelsHidden()
                    .tint(PrimaryColor)
            }
            else if wish.asWish.toggleType == .Checkbox {
                Button {
                    withAnimation {
                        onCLick()
                    }
                } label: {
                    Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                        .as_font(.title2, .regular, isSelected ? PrimaryColor.opacity(0.8) : Color(.systemGray3))
                }
            }
        }
        .padding(15)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.04), radius: 1, x: 1, y: 3)
    }
}
