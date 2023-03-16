//
//  ArticleImage.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct ArticleImage: View {
    var image: Image
    var body: some View{
        image
            .renderingMode(.original)
            .resizable()
            .frame(width: 155, height: 155)
            .cornerRadius(5)
            .shadow(radius: 7)
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(image: Image("1"))
    }
}
