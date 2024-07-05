//
//  InsuranceDetailsView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/6/24.
//

import SwiftUI

struct InsuranceDetailView: View {
    let insurance: Insurance
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(insurance.name)
                .font(.largeTitle)
                .padding(.top)
            
            Text("Price: \(insurance.price)")
            Text("Time Period: \(insurance.timePeriod)")
            //Text("Description: \(insurance.description)")
            Text("""
                                    Insurance services provide essential financial protection and peace of mind by covering a wide range of risks. They offer benefits such as:
                                    1. **Financial Security**: Protects against unexpected expenses due to accidents, illnesses, or disasters.
                                    2. **Risk Management**: Helps manage and mitigate potential risks, providing coverage for various life events.
                                    3. **Legal Compliance**: Ensures compliance with legal requirements, such as mandatory auto or health insurance.
                                    4. **Investment Opportunities**: Some insurance policies, like life insurance, offer investment benefits and build cash value over time.
                                    With a variety of insurance products available, individuals can find tailored solutions to meet their specific needs and safeguard their future.
                                    """)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Insurance Details")
    }
}
