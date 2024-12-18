//
//  AuthViewModel.swift
//  SwiftSup
//
//  Created by Ainur on 17.12.2024.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isRegistered = false
    @Published var errorMessage: String?

    func registerUser() async {
        do {
            let session = try await SupabaseManager.shared.client.auth
                .signUp(email: email, password: password)
            
            // Регистрация успешна
            DispatchQueue.main.async {
                self.isRegistered = true
                self.errorMessage = nil
            }
        } catch {
            // Обработка ошибки
            DispatchQueue.main.async {
                self.isRegistered = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
