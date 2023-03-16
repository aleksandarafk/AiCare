//
//  AiCareApp.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import SwiftUI

@main
struct AiCareApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)

        }
    }
}
