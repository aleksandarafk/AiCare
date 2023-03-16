//
//  ArticleRow.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct ArticleRow: View {
    var categoryName: String
    var items: [Article]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { article in
                        NavigationLink{
                            ArticleDetail(article: article)
                        } label: {
                            ArticleRowItem(article: article)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }

}

struct ArticleRow_Previews: PreviewProvider {
    static var article = ModelData().articles
    static var previews: some View {
        ArticleRow(
            categoryName: article[0].category.rawValue,
            items: Array(article.prefix(4))
        )
        .preferredColorScheme(.dark)
    }
}
