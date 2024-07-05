//
//  InsuranceView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/5/24.
//

import SwiftUI

struct InsuranceView: View {
    @StateObject private var viewModel = InsuranceViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.insurances) { insurance in
                        VStack(alignment: .leading) {
                            Text(insurance.name)
                                .font(.headline)
                            Text("Price: \(insurance.price)")
                            Text("Price: \(insurance.timePeriod)")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
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
        }
    }
}

struct InsuranceView_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceView()
    }
}
