//
//  LoginViewScreen.swift
//  LoginScreen
//
//  Created by Eduardo Bacha on 05/09/24.
//

import UIKit

class LoginView: UIView {
    
    // Elementos da UI
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backGround2") // Nome da imagem no Assets.xcassets
        imageView.contentMode = .scaleAspectFill // Ajusta a imagem para preencher a tela
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Email"
        let placeholderColor = UIColor.black
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress // Tipo de teclado para email
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white // Define o fundo branco
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Senha"
        let placeholderColor = UIColor.black
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white // Define o fundo branco
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white // Define a cor do texto para branco
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cadastro", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white // Define a cor do texto para branco
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        // Adiciona o backgroundImageView primeiro para que fique atrás dos outros elementos
        addSubview(backgroundImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
        
        setupConstraints()
    }
    
    // Configuração das constraints
    private func setupConstraints() {
        // Constraints para o backgroundImageView
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // Campo Email
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Campo Senha
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Botão Login
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        // Botão Cadastro
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    
    
    
    
}
