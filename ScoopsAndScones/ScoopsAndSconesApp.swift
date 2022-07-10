//
//  ScoopsAndSconesApp.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import SwiftUI

@main
struct ScoopsAndSconesApp: App {
    let model = IceCreamDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
