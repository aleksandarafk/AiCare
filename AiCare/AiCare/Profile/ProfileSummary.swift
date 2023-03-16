//
//  ProfileSummary.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

struct ProfileSummary: View {
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
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    @State private var showContentView = false
    @State private var showAlert = false
    var body: some View {
        List {
            VStack {
                AccountOverview(name: "Yoana Ivanova", email: "iv.iv.family@icloud.com", profilePicture: Image("Profile"))
                NavigationLink(destination: ProfileSummary( profile: Profile.default)) {
                VStack {
                    AccountUsername(name: profile.username)
                }
            }
        }
            
            Section(header: Text("badges_comp".localizableString(languages[selectedLanguage]))) {
                    HStack{
                        AiBadge(name: "comp_badge".localizableString(languages[selectedLanguage]))
                        AiBadge(name: "comp_badge1".localizableString(languages[selectedLanguage]))
                            .hueRotation(Angle(degrees:90))
                        AiBadge(name: "comp_badge2".localizableString(languages[selectedLanguage]))
                            .hueRotation(Angle(degrees: 300))
                    }
                .padding(.bottom)
            }
            
            Section(header: Text("badges_uncomp".localizableString(languages[selectedLanguage]))) {
                    HStack{
                        AiBadge(name: "uncomp_badge".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                        AiBadge(name: "uncomp_badge1".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                        AiBadge(name: "uncomp_badge2".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                    }
                    .padding(.bottom)
            }
        }
        .listStyle(.insetGrouped)
        .safeAreaInset(edge: .bottom){
            Button("delete_btn".localizableString(languages[selectedLanguage]), role: .destructive, action: {
                showAlert = true
            })
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("delete_title".localizableString(languages[selectedLanguage])),
                    message: Text("delete_msg".localizableString(languages[selectedLanguage])),
                    primaryButton: .destructive(Text("delete".localizableString(languages[selectedLanguage])), action: {
                        showContentView = true
                    }),
                    secondaryButton: .cancel(Text("cancel".localizableString(languages[selectedLanguage])))
                )
            }
            .fullScreenCover(isPresented: $showContentView, content: AiCareRegister.init)
        }
    }
    
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
