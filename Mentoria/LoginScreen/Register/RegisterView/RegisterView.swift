//
//  RegisterView.swift
//  LoginScreen
//
//  Created by Leonardo Fernandes on 10/09/24.
//

import UIKit

class RegisterView: UIView {
    
    // Elementos da UI
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backGround2") // Nome da imagem no Assets.xcassets
        imageView.contentMode = .scaleAspectFill // Ajusta a imagem para preencher a tela
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Nome"
        let placeholderColor = UIColor.black
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white // Define o fundo branco
        return textField
    }()

    let surnameTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Sobrenome"
        let placeholderColor = UIColor.black
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white // Define o fundo branco
        return textField
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
        textField.keyboardType = .emailAddress
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
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Repita a Senha"
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
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cadastrar", for: .normal)
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
        addSubview(backgroundImageView)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(registerButton)
        
        setupConstraints()
    }
    
    // Configuração das constraints
    private func setupConstraints() {
        // Espaçamento entre os campos
        let spacing: CGFloat = 20

        // Constraints para o backgroundImageView
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        // Campo Nome
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -200),
            nameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Campo Sobrenome
        NSLayoutConstraint.activate([
            surnameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: spacing),
            surnameTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Campo Email
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: spacing),
            emailTextField.widthAnchor.constraint(equalTo: surnameTextField.widthAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Campo Senha
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: spacing),
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Campo Repita a Senha
        NSLayoutConstraint.activate([
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: spacing),
            repeatPasswordTextField.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Botão Cadastrar
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: spacing),
            registerButton.widthAnchor.constraint(equalTo: repeatPasswordTextField.widthAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
