//
//  RotatedSymbol.swift
//  AiCare
//
//  Created by Yoana Ivanova on 11/03/2023.
//

import SwiftUI

struct RotatedSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedSymbol(angle: Angle(degrees: 5))
    }
}

