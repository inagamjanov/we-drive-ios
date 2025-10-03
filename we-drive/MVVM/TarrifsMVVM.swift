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

struct Tarrif: Identifiable {
    
    var id: String = UUID().uuidString
    
    var name: String
    var capacity: Int
    
    var price: Double
    var discountedPrice: Double
    
    var time: Double
    
    var cars: Array<String>
}

class TarrifsMVVM: ObservableObject {
    
    @Published var selectedTarrif: Tarrifs = .Econom
    
    var tarrifs: Array<Tarrif> = [
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(name: "WeDrive XL", capacity: 4, price: 26000, discountedPrice: 25000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
    ]
}
