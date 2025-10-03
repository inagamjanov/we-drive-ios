//
//  RideDetailsMVVM.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Wishes
enum Wishes: String, CaseIterable {
    case DontCall, Assistance, PetTransport, CantSpeak
    
    var asString: String {
        switch self {
        case .DontCall:
            "Telefon qilmang"
        case .Assistance:
            "Yordamchi kerak"
        case .PetTransport:
            "Uy hayvoni bor"
        case .CantSpeak:
            "Gapira olmayman"
        }
    }
}


// MARK: - Ride Details (Wants, For Another Person, ...)
class RideDetailsMVVM: ObservableObject {
    
    // Other Person
    @Published var anotherPerson: String? = nil
    
    // Wishes
    @Published var noSmoking: Bool = false
    @Published var childrenSeats: Bool = false
    
    @Published var wishes: Set<Wishes> = []
}
