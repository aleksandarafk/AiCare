//
//  FeaturedArticle.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct FeaturedArticle: View {
    var article: Article
    var body: some View {
        article.featureImage?
            .resizable()
            .aspectRatio(4 / 3, contentMode: .fit)
            .overlay {
                TextOverlay(article: article)
            }
    }
}


struct TextOverlay: View{
    var article: Article
    //coloring the text
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    //allignment of the text view
    var body: some View{
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading){
                Text(article.name)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct FeaturedArticle_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedArticle(article: ModelData().features[0])

    }
}
