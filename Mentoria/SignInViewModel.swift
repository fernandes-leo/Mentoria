//
//  SignInViewModel.swift
//  Mentoria
//
//  Created by Leonardo Fernandes on 10/09/24.
//

import Foundation

@Observable
final class SignInViewModel {
    var selectedOption: String = "Sign In"
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var errorMessage: String = ""
    var isSignedUp : Bool = false
    var isSignedIn : Bool = false
    
    private let supabaseAuthService = SupabaseAuthService()
    
    private func isValidEmail (_email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emaiPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emaiPred.evaluate(with: email)
    }
    
}

