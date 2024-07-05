//
//  LogInView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct LogInView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToServiceView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)

                VStack(spacing: 24) {
                    InputView(text: $viewModel.username, title: "Username", placeholder: "Enter your username")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)

                Spacer()

                NavigationLink {
                    InsuranceView()
                } label: {
                    HStack {
                        Text("Log In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 70, height: 48)
                }
                .background(Color(red: 34/255, green: 73/255, blue: 82/255))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.top, 24)
                .alert(item: $viewModel.errorMessage) { errorMessage in
                    Alert(title: Text("Login Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }

                Spacer()

                NavigationLink {
                    SignUpView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(Color(red: 235/255, green: 136/255, blue: 31/255))
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    LogInView()
}
