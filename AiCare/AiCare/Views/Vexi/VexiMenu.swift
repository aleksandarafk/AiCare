//
//  VexiMenu.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI

struct VexiMenu: View {
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
    @State private var showVexiChatView = false
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Image("robot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    Spacer()
                    
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height - geometry.safeAreaInsets.top)
                .background(Color.white)
            }
            .navigationBarTitle("Vexi")
            .safeAreaInset(edge: .bottom) {
                Button("cant_talk".localizableString(languages[selectedLanguage]), action: {
                    showAlert = true
                })
                .frame(maxWidth: .infinity)
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Vexi Chat".localizableString(languages[selectedLanguage])),
                        message: Text("vexi_message".localizableString(languages[selectedLanguage])),
                        primaryButton: .default(Text("confirm".localizableString(languages[selectedLanguage])), action: {
                            showVexiChatView = true
                        }),
                        secondaryButton: .cancel(Text("cancel".localizableString(languages[selectedLanguage])))
                    )
                }
                .fullScreenCover(isPresented: $showVexiChatView, content: VexiChat.init)

                }
            }
        }
    }

struct VexiMenu_Previews: PreviewProvider {
    static var previews: some View {
        VexiMenu()
    }
}

