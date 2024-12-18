//
//  AuthView.swift
//  SwiftSup
//
//  Created by Ainur on 17.12.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                Task {
                    await viewModel.registerUser()
                }
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            if viewModel.isRegistered {
                ContentView()
            }
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}
