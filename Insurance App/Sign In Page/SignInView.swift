//
//  SignInView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var personalID = ""
    @State private var password = ""
    @State private var confirmPassword = ""
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
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $fullName, title: "Full Name", placeholder: "Enter your name")
                        .autocapitalization(.none)
                    
                    InputView(text: $phoneNumber, title: "Phone Number", placeholder: "Enter your number")
                        .autocapitalization(.none)
                    
                    InputView(text: $personalID, title: "Personal ID", placeholder: "Enter your personal ID")
                        .autocapitalization(.none)
                    
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //Spacer()
                
                Button {
                    print("Sign user in..")
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
    }
}

#Preview {
    SignInView()
}
