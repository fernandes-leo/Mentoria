//
//  ViewController.swift
//  LoginScreen
//
//  Created by Eduardo Bacha on 03/09/24.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    // Referências aos elementos da view
    let loginView = LoginView()
    let db = Firestore.firestore() // Inicializa o Firestore

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginView)
        loginView.frame = view.bounds

        // Adiciona a ação ao botão de login
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        // Adiciona a ação ao botão de cadastro
        loginView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }

    @objc func handleLogin() {
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Por favor, preencha todos os campos.")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Erro no login: \(error.localizedDescription)")
            } else if let user = Auth.auth().currentUser, !user.isEmailVerified {
                self.showAlert(message: "Por favor, verifique seu email antes de fazer login.")
                try? Auth.auth().signOut() // Faz logout imediato
            } else {
                // Login bem-sucedido
                if let uid = Auth.auth().currentUser?.uid {
                    self.db.collection("users").document(uid).getDocument { document, error in
                        if let error = error {
                            print("Erro ao obter os dados do usuário: \(error.localizedDescription)")
                            self.showAlert(message: "Não foi possível obter os dados do usuário.")
                        } else if let document = document, document.exists {
                            let data = document.data()
                            let name = data?["name"] as? String ?? ""
                            let surname = data?["surname"] as? String ?? ""
                            // Utilize os dados conforme necessário
                            self.showAlert(message: "Bem-vindo, \(name) \(surname)!") {
                                let homeViewController = HomeViewController()
                                // Passe os dados para a próxima tela se necessário
//                                homeViewController.userName = "\(name) \(surname)"
                                self.navigationController?.pushViewController(homeViewController, animated: true)
                            }
                        } else {
                            print("Documento não encontrado")
                            self.showAlert(message: "Não foi possível obter os dados do usuário.")
                        }
                    }
                }
            }
        }
    }

    @objc func handleRegister() {
        // Navega para a RegisterViewController
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }

    func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alertController, animated: true)
    }
}
