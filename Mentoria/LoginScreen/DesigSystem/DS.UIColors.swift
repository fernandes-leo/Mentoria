//
//  DS.Colors.swift
//  LoginScreen
//
//  Created by Debora Rodrigues  on 19/09/24.
//

import Foundation
import UIKit

// MARK: - Extensão para cores
extension UIColor {
    // Função para converter hexadecimal em UIColor
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // Cores do design system
    static let primaryBlue = UIColor(hex: "#3B82F6")
    static let secondaryMint = UIColor(hex: "#34D399")
    static let neutralGray = UIColor(hex: "#F3F4F6")
    static let supportingOrange = UIColor(hex: "#FB923C")
    static let alertRed = UIColor(hex: "#F87171")
    
    
}
