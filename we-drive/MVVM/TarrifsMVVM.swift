//
//  TarrifsMVVM.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI

enum Tarrifs: String, CaseIterable {
    case Econom, Comfort, Business, All
    
    var asString: String {
        switch self {
        case .Econom:
            return "Ekonom"
        case .Comfort:
            return "Komfort"
        case .Business:
            return "Biznes"
        case .All:
            return "Hammasi"
        }
    }
}


class TarrifsMVVM: ObservableObject {
    
    @Published var selectedTarrif: Tarrifs = .Econom
    
}
