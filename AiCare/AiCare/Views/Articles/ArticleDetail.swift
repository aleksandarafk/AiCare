//
//  ArticleDetail.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct ArticleDetail: View {
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
    var article: Article
    var body: some View {
        ScrollView {
            VStack {
                article.image                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 16) {
                    Text(article.name.localizableString(languages[selectedLanguage]))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text(article.date.localizableString(languages[selectedLanguage]))
                            .font(.subheadline)
                            .foregroundColor(.white)

                    }
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.white)
                        Text(article.author.localizableString(languages[selectedLanguage]))
                            .font(.subheadline)
                            .foregroundColor(.white)

                    }
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(.white)
                        Text("5mins".localizableString(languages[selectedLanguage]))
                            .font(.subheadline)
                            .foregroundColor(.white)

                    }
                    Divider()
                    VStack{
                        Text(article.boldInfo.localizableString(languages[selectedLanguage]))
                            .font(.headline)
                            .bold()
                            .padding()
                            .foregroundColor(.black)
                        Text(article.description.localizableString(languages[selectedLanguage]))
                            .padding()
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    .background(Color.white)
                    .cornerRadius(16)

                }
                .padding()
                .background(Color("cyan"))
                .cornerRadius(16)
            }
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        .navigationTitle(article.name.localizableString(languages[selectedLanguage]))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: ModelData().articles[0])
    }
}

