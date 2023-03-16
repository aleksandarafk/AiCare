//
//  Article.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import Foundation
import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date: String
    var author: String
    var boldInfo: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    //categories in wich the landmarks are seperated
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case kids = "Kids"
        case general = "General"
        case vexi = "Vexi"

    }
    
    //unique images
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
