//
//  VexiFeatured.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI

struct AiCareFeatured: View {
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
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    PageView(pages: modelData.features.map { article in
                        NavigationLink(destination: ArticleDetail(article: article)) {
                            FeaturedArticle(article: article)
                        }
                    })
                    .padding(.horizontal)
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .cornerRadius(5)
                    .listRowInsets(EdgeInsets())
                    
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        ArticleRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    
                }
            }
            .listStyle(.plain)
            .overlay(
                ProfileView()
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -45)
                , alignment: .topTrailing)
            .navigationTitle("featured".localizableString(languages[selectedLanguage]))
        }
        .navigationBarHidden(true)
    }
}


struct ProfileView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        Image("Profile")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
}

struct AiCareFeatured_Previews: PreviewProvider {
    static var previews: some View {
        AiCareFeatured().environmentObject(ModelData())
    }
}
