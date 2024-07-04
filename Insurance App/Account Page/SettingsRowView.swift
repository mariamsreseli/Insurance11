//
//  SettingsRowView.swift
//  Insurance App
//
//  Created by Mariam Sreseli on 7/4/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
        }
    }
}

//struct SettingsRowView_Previews: PreviewProvider {
//    staic var previews: some View
//    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
//}
