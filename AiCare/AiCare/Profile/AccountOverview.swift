//
//  AccountOverview.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

struct AccountOverview: View {
    var name: String
    var email: String
    var profilePicture: Image
    
    var body: some View {
        HStack(spacing: 16) {
            profilePicture
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct AccountOverview_Previews: PreviewProvider {
    static var previews: some View {
        AccountOverview(name: "Yoanna Ivanova", email: "iv.iv.family@icloud.com", profilePicture: Image("Profile"))
            .previewLayout(.fixed(width: 375, height: 100))
            .padding()
    }
}

