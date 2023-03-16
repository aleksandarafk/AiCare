//
//  ArticleList.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct ArticleList: View {
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
    @State private var showFavoritesOnly = false
    @State private var searchText = ""

    var filteredPlaces: [Article] {
        modelData.articles.filter { article in
            (!showFavoritesOnly || article.isFavorite) &&
                (searchText.isEmpty || article.name.localizedStandardContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                List(filteredPlaces) { article in
                    NavigationLink(destination:    ArticleDetail(article: article)) {
                        ArticleCard(article: article)
                    }
                }
                .listStyle(GroupedListStyle())

                Toggle(isOn: $showFavoritesOnly) {
                    Text("fav_articles".localizableString(languages[selectedLanguage]))
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            .navigationTitle("articles".localizableString(languages[selectedLanguage]))

        }
            
    }
}

struct ArticleCard: View {
    var article: Article
    var body: some View {
        HStack {
            article.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(article.name)
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            Spacer()

            if article.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 5)
    }
}

struct SearchBar: View {
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
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("search".localizableString(languages[selectedLanguage]), text: $text)
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList().environmentObject(ModelData())
        }
    }

