//
//  AiCareLogin.swift
//  AiCare
//
//  Created by Yoana Ivanova on 12/03/2023.
//

import SwiftUI

struct AiCareLogin: View {
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
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("girl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                    .padding()
                Text("login".localizableString(languages[selectedLanguage]))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8, content:{
                    HStack{
                        Image(systemName: "mail")
                            .foregroundColor(Color(.darkGray))
                        TextField("email".localizableString(languages[selectedLanguage]), text: $email)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color(.darkGray))
                    }
                    Divider()
                })
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 8, content:{
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(Color(.darkGray))
                        SecureField("password".localizableString(languages[selectedLanguage]), text: $password)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color(.darkGray))
                    }
                    Divider()
                })
                .padding(.top, 10)
                Button(action: {}, label:{
                    Text("forgot_pass".localizableString(languages[selectedLanguage]))
                        .fontWeight(.medium)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                
                NavigationLink(destination: AiCareHome()) {
                    Text("login_btn".localizableString(languages[selectedLanguage]))
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("cyan"))
                        .cornerRadius(15)
                    
                }
                .padding(.top, 5)
                
                HStack{
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(height: 1)
                    Text("or".localizableString(languages[selectedLanguage]))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black.opacity(0.3))
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .frame(height: 1)
                }
                .padding(.vertical)
                
                NavigationLink(destination: AiCareHome()) {
                    Text("login_appl".localizableString(languages[selectedLanguage]))
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.black))
                        .cornerRadius(15)
                }
                .padding(.top, 5)
                
            }
            .padding()
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Text("login_msg".localizableString(languages[selectedLanguage]))
                        .fontWeight(.light)
                    NavigationLink(destination: AiCareRegister()) {
                            Text("register".localizableString(languages[selectedLanguage]))
                                .fontWeight(.light)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct AiCareLogin_Previews: PreviewProvider {
    static var previews: some View {
        AiCareLogin()
            .environmentObject(ModelData())
    }
}
