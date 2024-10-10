//
//  TCA_1App.swift
//  TCA-1
//
//  Created by 정의찬 on 9/3/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Feature.State(), reducer: {
                Feature()
            }))
        }
    }
}
