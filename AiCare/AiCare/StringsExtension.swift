//
//  StringsExtension.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 12/03/2023.
//

import Foundation

extension String {
    func localizableString(_ language: String) -> String {
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
