//
//  RegisterViewController.swift
//  LoginScreen
//
//  Created by Leonardo Fernandes on 11/09/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

import UIKit
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    // Referências aos elementos da view
    let registerView = RegisterView()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(registerView)
        registerView.frame = view.bounds
        
        registerView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    @objc func handleRegister() {
        guard let name = registerView.nameTextField.text, !name.isEmpty,
              let surname = registerView.surnameTextField.text, !surname.isEmpty,
              let email = registerView.emailTextField.text, !email.isEmpty,
              let password = registerView.passwordTextField.text, !password.isEmpty,
              let repeatPassword = registerView.repeatPasswordTextField.text, !repeatPassword.isEmpty else {
            showAlert(message: "Por favor, preencha todos os campos.")
            return
        }
        
        // Verifica se as senhas coincidem
        guard password == repeatPassword else {
            showAlert(message: "As senhas não coincidem.")
            return
        }
        
        // Cria o usuário no Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Erro no cadastro: \(error.localizedDescription)")
            } else {
                // Envia o email de verificação
                Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                    if let error = error {
                        print("Erro ao enviar email de verificação: \(error.localizedDescription)")
                    } else {
                        print("Email de verificação enviado.")
                    }
                })
                
                // Salva os dados adicionais no Firestore
                if let uid = Auth.auth().currentUser?.uid {
                    self.db.collection("users").document(uid).setData([
                        "name": name,
                        "surname": surname,
                        "email": email
                    ]) { error in
                        if let error = error {
                            print("Erro ao salvar dados do usuário: \(error.localizedDescription)")
                        } else {
                            print("Dados do usuário salvos com sucesso.")
                        }
                    }
                }
                
                // Cadastro bem-sucedido
                self.showAlert(message: "Cadastro bem-sucedido! Verifique seu email para ativar sua conta.") {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alertController, animated: true)
    }
}
