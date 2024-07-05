//
//  InsuranceView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

//import SwiftUI
//
//struct InsuranceView: View {
//    @StateObject private var viewModel = InsuranceViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color(red: 228/255, green: 229/255, blue: 230/255)
//                    .edgesIgnoringSafeArea(.all)
//                ScrollView {
//                    VStack( spacing: 60) {
//                        Image("insurance")
//                            .resizable()
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .frame(width: UIScreen.main.bounds.width - 90, height: 150)
//                        
//                        ForEach(viewModel.insurances) { insurance in
//                            VStack(alignment: .leading, spacing: 10) {
//                                Text(insurance.name)
//                                    .font(.headline)
//                                Text("Price: \(insurance.price)")
//                                Text("Time Period: \(insurance.timePeriod)")
//                                
//                            }
//                            
//                            .frame(width: UIScreen.main.bounds.width - 70, height: 120)
//                            .padding()
//                            .background(Color(red: 106/255, green: 164/255, blue: 173/255))
//                            .foregroundStyle(Color.white)
//                            .font(.headline)
//                            .cornerRadius(8)
//                        }
//                    }
//                    .padding()
//                }
//                .navigationTitle("Insurances")
//                .onAppear {
//                    viewModel.fetchInsurances()
//                }
//                .alert(item: $viewModel.errorMessage) { errorMessage in
//                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//                }
//            }
//        }
//    }
//}
//struct InsuranceView_Previews: PreviewProvider {
//    static var previews: some View {
//        InsuranceView()
//    }
//}

import SwiftUI

struct InsuranceView: View {
    @StateObject private var viewModel = InsuranceViewModel()
    @State private var isShowingDetail = false
    @State private var selectedInsurance: Insurance?

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 228/255, green: 229/255, blue: 230/255)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 60) {
                        Image("insurance")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: UIScreen.main.bounds.width - 90, height: 150)
                        
                        ForEach(viewModel.insurances) { insurance in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(insurance.name)
                                    .font(.headline)
                                Text("Price: \(insurance.price)")
                                Text("Time Period: \(insurance.timePeriod)")

                                Button(action: {
                                    selectedInsurance = insurance
                                    isShowingDetail = true
                                }) {
                                    Text("Click for more")
                                        .padding()
                                        .background(Color(red: 201/255, green: 178/255, blue: 140/255))
                                        .cornerRadius(8)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 70, height: 150)
                            .padding()
                            .background(Color(red: 106/255, green: 164/255, blue: 173/255))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Insurances")
                .onAppear {
                    viewModel.fetchInsurances()
                }
                .alert(item: $viewModel.errorMessage) { errorMessage in
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .sheet(isPresented: $isShowingDetail) {
                    if let selectedInsurance = selectedInsurance {
                        InsuranceDetailView(insurance: selectedInsurance)
                    }
                }
            }
        }
    }
}

struct InsuranceView_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceView()
    }
}
