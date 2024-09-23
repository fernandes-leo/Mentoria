//
//  DS.UIFonts.swift
//  LoginScreen
//
//  Created by Debora Rodrigues  on 19/09/24.
//

import Foundation
import UIKit

// MARK: - Extensão para tipografia
extension UIFont {
    // Tipografia do Design System
    static let heading1 = UIFont(name: "Poppins-Bold", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .bold)
    static let heading2 = UIFont(name: "Poppins-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    static let paragraph = UIFont(name: "Roboto-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    static let button = UIFont(name: "Roboto-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
}
