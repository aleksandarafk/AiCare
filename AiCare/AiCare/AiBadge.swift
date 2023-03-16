//
//  AiBadge.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

struct AiBadge: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct AiBadge_Previews: PreviewProvider {
    static var previews: some View {
        AiBadge(name: "Testing")
    }
}
