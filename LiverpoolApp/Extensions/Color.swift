//
//  Color.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

extension Color {
    init?(hexColor: String) {
        var hexSanitized = hexColor.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hexSanitized.count > 7 {
            hexSanitized = String(hexSanitized.prefix(7))
        }
        
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        guard hexSanitized.count == 6 else { return nil }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
