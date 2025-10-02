//
//  Helper.swift
//  we-drive
//
//  Created by Inagamjanov on 02/10/25.
//

import SwiftUI


// MARK: - Custom Rounded Shape
struct RoundedShape: Shape {
    var corners: UIRectCorner = [.topLeft, .topRight]
    var radius: Int = 25
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: CGFloat(radius), height: CGFloat(radius)))
        return Path(path.cgPath)
    }
}
