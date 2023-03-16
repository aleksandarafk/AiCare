//
//  VexiHome.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI

struct AiCareHome: View {
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

    @State private var selection: Tab = .featured

    enum Tab{
        case featured
        case articles
        case vexi
        case map
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection){
            AiCareFeatured()
                .tabItem{
                    Label("featured".localizableString(languages[selectedLanguage]), systemImage: "star")
                }
                .tag(Tab.featured)
            ArticleList()
                .tabItem{
                    Label("articles".localizableString(languages[selectedLanguage]), systemImage: "list.bullet")
                }
                .tag(Tab.articles)
            VexiMenu()
                .tabItem{
                    Label("Vexi", systemImage: "lamp.desk")
                }
            AiCareMap()
                .tabItem{
                    Label("map".localizableString(languages[selectedLanguage]), systemImage: "map")
                }
                .tag(Tab.map)

                .tag(Tab.vexi)
            ProfileSummary(profile: Profile.default)                .tabItem{
                    Label("profile".localizableString(languages[selectedLanguage]), systemImage: "person.crop.circle")
                }
                .tag(Tab.profile)
        }
    }
}

struct AiCareHome_Previews: PreviewProvider {
    static var previews: some View {
        AiCareHome()
            .environmentObject(ModelData())

    }
}
