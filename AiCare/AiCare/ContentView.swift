//
//  ContentView.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AiCareLogin()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
