//
//  CustomButton.swift
//  LoginScreen
//
//  Created by Debora Rodrigues  on 19/09/24.
//

import UIKit

class CustomButton: UIButton {
    
    enum ButtonStyle {
        case primary
        case secondary
        case alert
        case custom(backgroundColor: UIColor, textColor: UIColor)
    }
    
    // Inicializador para criação programática
    init(title: String, style: ButtonStyle, cornerRadius: CGFloat = 8) {
        super.init(frame: .zero)
        setupButton(title: title, style: style, cornerRadius: cornerRadius)
    }
    
    // Inicializador para criação via storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Função de configuração do botão
    private func setupButton(title: String, style: ButtonStyle, cornerRadius: CGFloat) {
        setTitle(title, for: .normal)
        layer.cornerRadius = cornerRadius
        titleLabel?.font = UIFont.button
        setupStyle(style)
        clipsToBounds = true
    }
    
    // Configuração dos diferentes estilos
    private func setupStyle(_ style: ButtonStyle) {
        switch style {
        case .primary:
            backgroundColor = UIColor.primaryBlue
            setTitleColor(.white, for: .normal)
        case .secondary:
            backgroundColor = UIColor.secondaryMint
            setTitleColor(.white, for: .normal)
        case .alert:
            backgroundColor = UIColor.alertRed
            setTitleColor(.white, for: .normal)
        case .custom(let backgroundColor, let textColor):
            self.backgroundColor = backgroundColor
            setTitleColor(textColor, for: .normal)
        }
    }
    
    // Função para ajustar o estado pressionado
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.7 : 1.0
        }
        
        
    }
}
