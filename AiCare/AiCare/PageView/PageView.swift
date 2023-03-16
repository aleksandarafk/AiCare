//
//  PageView.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 11/03/2023.
//

import SwiftUI

struct PageView<Page:View>: View {
    //variable for the changable pages
    var pages: [Page]
    @State private var currentPage = 0
    
    //zstack view with a custom allignment for the PageViewController and PageControl responsible for the swiping interction on the card
    var body: some View{
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
                .offset(y: -2)
                .offset(x: 5)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        //loading the page view with the featured parts of the .json file and adding the aspect ratio + featured card start
        PageView(pages: ModelData().features.map{FeaturedArticle(article: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
