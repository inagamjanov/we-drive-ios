//
//  RideDetailsMVVM.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Wishes
enum Wishes: String, CaseIterable {
    
    case ChildSeat, NoSmoking, DontCall, Assistance, PetTransport, CantSpeak
    
    var asWish: Wish {
        switch self {
        case .ChildSeat:
            Wish(id: 1, image: "", title: "Bolalar o'rindig'i", caption: "2 000 so'm", toggleType: .Toggle)
        case .NoSmoking:
            Wish(id: 2, image: "", title: "Chekilmasin", caption: "200 so'm", toggleType: .Toggle)
        case .DontCall:
            Wish(id: 3, image: nil, title: "Telefon qilmang", caption: nil, toggleType: .Checkbox)
        case .Assistance:
            Wish(id: 4, image: nil, title: "Assistent kerak", caption: nil, toggleType: .Checkbox)
        case .PetTransport:
            Wish(id: 5, image: nil, title: "Uy hayvoni mavjud", caption: nil, toggleType: .Checkbox)
        case .CantSpeak:
            Wish(id: 6, image: nil, title: "Gapira olmayman", caption: nil, toggleType: .Checkbox)
        }
    }
}


// MARK: - Wish Check Type
enum WishToggleType: Int {
    case Toggle, Checkbox
}


// MARK: - Wish
struct Wish: Identifiable {
    
    var id: Int
    
    var image: String?
    var title: String
    var caption: String?
    
    var toggleType: WishToggleType
}


// MARK: - Ride Details (Wants, For Another Person, ...)
class RideDetailsMVVM: ObservableObject {
    
    // Other Person
    @Published var anotherPerson: String? = nil
    
    // Wishes
    @Published var wishes: Set<Wishes> = []
}
