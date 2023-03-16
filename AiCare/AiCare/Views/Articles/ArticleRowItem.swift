//
//  ArticleRowItem.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct ArticleRowItem: View {
    var article: Article
    var body: some View {
        VStack{
            article.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(article.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct ArticleRowItem_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowItem(article: ModelData().articles[0])
            .preferredColorScheme(.dark)
    }
}
