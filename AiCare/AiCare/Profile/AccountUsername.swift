//
//  AccountUsername.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

import SwiftUI

struct AccountUsername: View {
    @State private var selectedLanguage: Int = {
        let languageCode = Locale.current.languageCode
        if languageCode == "bg" {
            return 1
        } else if languageCode == "nl" {
            return 2
        } else {
            return 0
        }
    }()
    let languages = ["en", "bg", "nl"]
    var name: String
    var body: some View {
        HStack(spacing: 16) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text("username".localizableString(languages[selectedLanguage]))
                    
            }
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AccountUsername_Previews: PreviewProvider {
    static var previews: some View {
        AccountUsername(name: "yoanaiv")
            .padding()
    }
}

