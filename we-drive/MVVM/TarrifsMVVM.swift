//
//  TarrifsMVVM.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI

enum Tarrifs: String, CaseIterable {
    case All, Econom, Comfort, Green, Business
    
    var asString: String {
        switch self {
        case .Econom:
            return "Ekonom"
        case .Comfort:
            return "Komfort"
        case .Green:
            return "Yashil"
        case .Business:
            return "Biznes"
        case .All:
            return "Hammasi"
        }
    }
}

struct Tarrif: Identifiable {
    
    var id: Int
    
    var bgImg: String
    
    var name: String
    var capacity: Int
    
    var tarrif: Tarrifs
    
    var price: Double
    var discountedPrice: Double
    
    var time: Double
    
    var cars: Array<String>
}

class TarrifsMVVM: ObservableObject {
    
    @Published var selectedTarrif: Tarrifs = .All
    @Published var selectedTarrifCar: Int = 1
    
    var tarrifs: Array<Tarrif> = [
        Tarrif(id: 1, bgImg: "first", name: "WeDrive X", capacity: 4, tarrif: .Econom, price: 26000, discountedPrice: 21000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 2, bgImg: "ninth", name: "WeDrive XL", capacity: 4, tarrif: .Econom, price: 31000, discountedPrice: 26000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 3, bgImg: "second", name: "Damas", capacity: 6, tarrif: .Econom, price: 26000, discountedPrice: 21000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 4, bgImg: "third", name: "Comfort", capacity: 4, tarrif: .Comfort, price: 35000, discountedPrice: 30000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 5, bgImg: "fourth", name: "Minivan", capacity: 6, tarrif: .Comfort, price: 40000, discountedPrice: 35000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 6, bgImg: "fifth", name: "Green", capacity: 4, tarrif: .Green, price: 35000, discountedPrice: 30000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 7, bgImg: "sixth", name: "Black", capacity: 4, tarrif: .Business, price: 55000, discountedPrice: 50000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 8, bgImg: "seventh", name: "Black SUV", capacity: 4, tarrif: .Business, price: 60000, discountedPrice: 55000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"]),
        Tarrif(id: 9, bgImg: "eight", name: "Black VIP", capacity: 6, tarrif: .Business, price: 70000, discountedPrice: 65000, time: 12, cars: ["Chevrolet Spark", "Daewoo Nexia", "Nexia 3"])
    ]
}
