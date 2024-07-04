//
//  AboutView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color(red: 34/255, green: 73/255, blue: 82/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                
                Text("ClaimSmart")
                    .font(.title)
                    .foregroundStyle(Color(red: 242/255, green: 140/255, blue: 40/255))
                   
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.title2)
                                .foregroundStyle(Color(red: 232/255, green: 231/255, blue: 230/255))
                            
                            Divider()
                                .background(Color.white)
                            
                            Text("ClaimSmart Insurance is the most advanced insurance available. Our digital services allow you to purchase insurance products and get instant compensation online, or take advantage of our convenient smartphone app.")
                                .frame(height: 150)
                                .foregroundStyle(Color(red: 232/255, green: 231/255, blue: 230/255))
                        }
                        .padding()
                        
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                        .frame(height: 100)
                    
                    
                    VStack {
                        Button(action: {print("button tapped")}, label: {
                            Text("Log In")
                                .font(.headline)
                                .padding()
                                .foregroundStyle(Color(red: 235/255, green: 136/255, blue: 31/255))
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color(red: 206/255, green: 206/255, blue: 203/255))
                                        .frame(width: 250)
                                )
                        })
                        
                        Button(action: { print("button tapped")}, label: {
                            Text("Sign In")
                                .font(.headline)
                                .padding()
                                .foregroundStyle(Color(red: 235/255, green: 136/255, blue: 31/255))
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color(red: 206/255, green: 206/255, blue: 203/255))
                                        .frame(width: 250)
                                )
                        })
                        
                    }
                    
                    
                    
                }

                Spacer()
            }
            .padding()
            
        
            
            
        }
    }
}

#Preview {
    AboutView()
}
