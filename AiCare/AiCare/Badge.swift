//
//  Badge.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

struct Badge: View {
    var badgeSymbol: some View {
        ForEach(0..<8){ index in
            RotatedSymbol(angle: .degrees(Double(index) / Double(4)) * 360.0)
        }
        .opacity(0.5)
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader{ geometry in
                badgeSymbol
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0 * geometry.size.height))
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

