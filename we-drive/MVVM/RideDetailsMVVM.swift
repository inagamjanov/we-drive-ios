//
//  RideDetailsMVVM.swift
//  we-drive
//
//  Created by Inagamjanov on 03/10/25.
//

import SwiftUI


// MARK: - Ride Details (Wants, For Another Person, ...)
class RideDetailsMVVM: ObservableObject {
    
    @Published var anotherPerson: String? = nil
}
