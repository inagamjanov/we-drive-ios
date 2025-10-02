//
//  Extension.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI


// MARK: - Color Extensions
extension Color {
    
    // Initializer with hex code
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


// MARK: - View Extensions
extension View {
    func as_font(_ size: Font.TextStyle = .body, _ weight: Font.Weight = .regular, _ color: Color = PrimaryColor, _ line_limit: Int = Int.max, _ align: TextAlignment = .leading, design: Font.Design? = .default, reserve_space: Bool = false) -> some View {
        self
            .font(.system(size, design: design).weight(weight))
            .foregroundColor(color)
            .lineLimit(line_limit)
            .multilineTextAlignment(align)
            .lineLimit(line_limit, reservesSpace: reserve_space)
    }
}
