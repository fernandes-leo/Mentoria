//
//  HomeView.swift
//  LoginScreen
//
//  Created by Leonardo Fernandes on 11/09/24.
//

import UIKit

class HomeView: UIView {

    // Label de Boas-vindas
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Inicializador da UIView customizada
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // Função para configurar os elementos da view
    private func setupView() {
        backgroundColor = .white  // Define o fundo branco
        addSubview(welcomeLabel)
        
        setupConstraints()
    }
    
    // Configuração das constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
