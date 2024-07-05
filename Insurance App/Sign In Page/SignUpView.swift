//
//  SignInView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignupViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)

                VStack(spacing: 24) {
                    InputView(text: $viewModel.username, title: "Username", placeholder: "Enter your username")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.full_name, title: "Full Name", placeholder: "Enter your name")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.phone_number, title: "Phone Number", placeholder: "Enter your number")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.personal_number, title: "Personal ID", placeholder: "Enter your personal ID")
                        .autocapitalization(.none)

                    InputView(text: $viewModel.password, title: "Password", placeholder: "Enter your password", isSecureField: true)

                    InputView(text: $viewModel.confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)

                NavigationLink {
                    InsuranceView()
                } label: {
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 70, height: 48)
                }
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.top, 24)
                .alert(isPresented: $viewModel.showError) {
                    Alert(title: Text("Signup Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }

                Spacer()

                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
        .padding()
        .onAppear {
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
